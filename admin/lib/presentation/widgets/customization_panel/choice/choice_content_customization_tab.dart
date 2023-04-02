import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:survey_admin/presentation/app/localization/app_localizations_ext.dart';
import 'package:survey_admin/presentation/pages/builder/builder_cubit.dart';
import 'package:survey_admin/presentation/pages/builder/builder_state.dart';
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
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        CustomizationItemsContainer(
          title: context.localization.title,
          isTopDividerShown: true,
          children: [
            CustomizationMultilineTextField(
              value: widget.editable.title,
              maxHeight: AppDimensions.sizeXL,
              onChanged: (title) => widget.onChange(
                widget.editable.copyWith(title: title),
              ),
            ),
          ],
        ),
        CustomizationItemsContainer(
          title: context.localization.subtitle,
          children: [
            CustomizationMultilineTextField(
              value: widget.editable.subtitle,
              maxHeight: AppDimensions.sizeXL,
              onChanged: (subtitle) => widget.onChange(
                widget.editable.copyWith(subtitle: subtitle),
              ),
            ),
          ],
        ),
        CustomizationItemsContainer(
          title: context.localization.options,
          children: [
            // TODO(dev): Split to items.
            OptionCustomizationItem(
              options: widget.editable.options,
              ruleValue: widget.editable.ruleValue,
              onChanged: (options) => widget.onChange(
                widget.editable.copyWith(options: options),
              ),
              // TODO(dev): Move repeated method somewhere.
              onRuleValueChanged: (ruleValue) => widget.onChange(
                widget.editable.copyWith(ruleValue: ruleValue),
              ),
            ),
          ],
        ),
        if (widget.editable.isMultipleChoice)
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
                                widget.editable.copyWith(ruleType: rule),
                              ),
                              child: Text(
                                e.name,
                                style: context.theme.textTheme.bodyLarge,
                              ),
                            ),
                          )
                          .toList(),
                      value: widget.editable.ruleType,
                      withColor: true,
                    ),
                  ),
                  const SizedBox(width: AppDimensions.marginXS),
                  Expanded(
                    child: widget.editable.ruleType != RuleType.none
                        ? _RuleDropdown(
                            onChanged: (ruleValue) => widget.onChange(
                              widget.editable.copyWith(ruleValue: ruleValue),
                            ),
                            values: List<int>.generate(
                              widget.editable.options.length + 1,
                              (i) => i++,
                            ),
                            value: widget.editable.ruleValue,
                          )
                        : const SizedBox(),
                  ),
                ],
              ),
            ],
          ),
      ],
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
