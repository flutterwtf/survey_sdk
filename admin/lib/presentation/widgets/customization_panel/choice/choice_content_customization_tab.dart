import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:survey_admin/presentation/app/localization/localizations.dart';
import 'package:survey_admin/presentation/pages/builder/builder_cubit.dart';
import 'package:survey_admin/presentation/pages/builder/builder_state.dart';
import 'package:survey_admin/presentation/utils/constants/app_dimensions.dart';
import 'package:survey_admin/presentation/utils/theme_extension.dart';
import 'package:survey_admin/presentation/app/localization/app_localizations_ext.dart';
import 'package:survey_admin/presentation/utils/utils.dart';
import 'package:survey_admin/presentation/widgets/customization_items/customization_items_container.dart';
import 'package:survey_admin/presentation/widgets/customization_items/customization_multiline_text_field.dart';
import 'package:survey_admin/presentation/widgets/customization_items/dropdown_customization_button.dart';
import 'package:survey_admin/presentation/widgets/customization_items/option_customization_item.dart';
import 'package:survey_admin/presentation/widgets/customization_panel/customization_tab.dart';
import 'package:survey_core/survey_core.dart';

class ChoiceContentCustomizationTab extends CustomizationTab {
  final void Function(QuestionData data) onChange;
  final ChoiceQuestionData editable;

  const ChoiceContentCustomizationTab({
    required this.onChange,
    required super.title,
    required this.editable,
    super.key,
  });

  @override
  State<CustomizationTab> createState() => ChoiceContentCustomizationTabState();
}

class ChoiceContentCustomizationTabState
    extends CustomizationTabState<ChoiceContentCustomizationTab> {
  List<int> _initialLimitedList(List<String> listOptions) {
    // TODO(dev): we should rethink this.
    final limitedList = <int>[];
    if (listOptions.isEmpty) {
      limitedList.add(0);
    } else {
      // TODO(dev): do-while loop maybe?
      for (var i = 0; i <= listOptions.length; i++) {
        limitedList.add(i);
      }
    }
    return limitedList;
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BuilderCubit, BuilderState>(
      builder: (context, state) {
        final data = widget.editable;
        return ListView(
          children: [
            CustomizationItemsContainer(
              title: context.localization.title,
              isTopDividerShown: true,
              children: [
                CustomizationMultilineTextField(
                  maxHeight: AppDimensions.sizeXL,
                  onChanged: (title) => widget.onChange(
                    data.copyWith(title: title),
                  ),
                ),
              ],
            ),
            CustomizationItemsContainer(
              title: context.localization.subtitle,
              children: [
                CustomizationMultilineTextField(
                  maxHeight: AppDimensions.sizeXL,
                  onChanged: (subtitle) => widget.onChange(
                    data.copyWith(subtitle: subtitle),
                  ),
                ),
              ],
            ),
            CustomizationItemsContainer(
              title: context.localization.options,
              children: [
                // TODO(dev): Split to items.
                OptionCustomizationItem(
                  options: data.options,
                  ruleValue: data.ruleValue,
                  onChanged: (options) => widget.onChange(
                    data.copyWith(options: options),
                  ),
                  // TODO(dev): Move repeated method somewhere.
                  onRuleValueChanged: (ruleValue) => widget.onChange(
                    data.copyWith(ruleValue: ruleValue),
                  ),
                ),
              ],
            ),
            if (data.isMultipleChoice)
              CustomizationItemsContainer(
                title: context.localization.rule,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: DropdownCustomizationButton<RuleType>(
                          items: RuleType.values
                              .map(
                                (e) => DropdownCustomizationItem<RuleType>(
                                  value: e,
                                  onChange: (rule) => widget.onChange(
                                    data.copyWith(ruleType: rule),
                                  ),
                                  child: Text(
                                    e.name,
                                    style: context.theme.textTheme.bodyLarge,
                                  ),
                                ),
                              )
                              .toList(),
                          value: data.ruleType,
                          withColor: true,
                        ),
                      ),
                      const SizedBox(width: AppDimensions.marginXS),
                      Expanded(
                        child: data.ruleType != RuleType.none
                            ? _RuleDropdown(
                                onChanged: (ruleValue) => widget.onChange(
                                  data.copyWith(ruleValue: ruleValue),
                                ),
                                values: _initialLimitedList(data.options),
                                value: data.ruleValue,
                              )
                            : const SizedBox(),
                      ),
                    ],
                  ),
                ],
              ),
          ],
        );
      },
    );
  }
}

class _RuleDropdown extends StatelessWidget {
  final ValueChanged<int>? onChanged;
  final List<int> values;
  final int value;

  const _RuleDropdown({
    required this.onChanged,
    required this.values,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownCustomizationButton<int>(
      items: values
          .map(
            (e) => DropdownCustomizationItem<int>(
              value: e,
              onChange: onChanged,
              child: Text(
                e.toString(),
                style: context.theme.textTheme.bodyLarge,
              ),
            ),
          )
          .toList(),
      value: value,
      withColor: true,
    );
  }
}
