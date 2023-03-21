import 'package:flutter/material.dart';
import 'package:survey_admin/presentation/app/localization/localizations.dart';
import 'package:survey_admin/presentation/utils/colors.dart';
import 'package:survey_admin/presentation/utils/constants/app_dimensions.dart';
import 'package:survey_admin/presentation/utils/theme_extension.dart';
import 'package:survey_admin/presentation/widgets/customization_items/customization_items_container.dart';
import 'package:survey_admin/presentation/widgets/customization_items/customization_multiline_text_field.dart';
import 'package:survey_admin/presentation/widgets/customization_items/dropdown_customization_button.dart';
import 'package:survey_admin/presentation/widgets/customization_items/option_customization_item.dart';
import 'package:survey_admin/presentation/widgets/customization_panel/choice/choice_customization_panel.dart';
import 'package:survey_admin/presentation/widgets/customization_panel/customization_tab.dart';
import 'package:survey_core/survey_core.dart';

class ChoiceContentCustomizationTab extends CustomizationTab {
  final ValueChanged<String> onTitleChanged;
  final ValueChanged<String> onSubTitleChanged;
  final ValueChanged<List<String>> onOptionsChanged;
  final ValueChanged<RuleType> onRuleChanged;
  final ValueChanged<int> onRuleLimitedChanged;
  final QuestionData editableQuestion;
  final RuleType ruleType;
  final int ruleValue;
  final List<String> listOptions;

  const ChoiceContentCustomizationTab({
    required super.title,
    required this.onTitleChanged,
    required this.onSubTitleChanged,
    required this.onOptionsChanged,
    required this.onRuleChanged,
    required this.editableQuestion,
    required this.ruleType,
    required this.listOptions,
    required this.onRuleLimitedChanged,
    required this.ruleValue,
    super.key,
  });

  List<int> _initialLimitedList(List<String> listOptions) {
    // TODO(dev): we should rethink this
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
    return ListView(
      children: [
        CustomizationItemsContainer(
          title: context.localization.title,
          isTopDividerShown: true,
          children: [
            CustomizationMultilineTextField(
              maxHeight: AppDimensions.sizeXL,
              onChanged: onTitleChanged,
            ),
          ],
        ),
        CustomizationItemsContainer(
          title: context.localization.subtitle,
          children: [
            CustomizationMultilineTextField(
              maxHeight: AppDimensions.sizeXL,
              onChanged: onSubTitleChanged,
            ),
          ],
        ),
        CustomizationItemsContainer(
          title: context.localization.options,
          children: [
            OptionCustomizationItem(
              options: listOptions,
              onChanged: onOptionsChanged,
              onRuleLimitedChanged: onRuleLimitedChanged,
              ruleValue: ruleValue,
            ),
          ],
        ),
        if (!(editableQuestion as ChoiceQuestionData).isMultipleChoice)
          CustomizationItemsContainer(
            title: context.localization.rule,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: DecoratedBox(
                      decoration: const BoxDecoration(
                        border: Border(
                          right: BorderSide(
                            color: Colors.grey,
                            // For demonstration.
                            width: 1.0,
                          ),
                        ),
                      ),
                      child: DropdownCustomizationButton<RuleType>(
                        items: RuleType.values
                            .map(
                              (e) => DropdownCustomizationItem<RuleType>(
                                value: e,
                                onChange: onRuleChanged,
                                child: Text(
                                  e.name,
                                  style: context.theme.textTheme.bodyLarge,
                                ),
                              ),
                            )
                            .toList(),
                        value: ruleType,
                      ),
                    ),
                  ),
                  Expanded(
                    child: ruleType != RuleType.none
                        ? _RuleDropdown(
                            onChanged: onRuleLimitedChanged,
                            values: _initialLimitedList(listOptions),
                            value: ruleValue,
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
    );
  }
}
