import 'package:flutter/material.dart';
import 'package:survey_admin/presentation/app/localization/app_localizations_ext.dart';
import 'package:survey_admin/presentation/utils/utils.dart';
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
                      withColor: true,
                    ),
                  ),
                  const SizedBox(width: AppDimensions.marginXS),
                  Expanded(
                    child: ruleType != RuleType.none
                        ? _RuleDropdown(
                            onChanged: onRuleLimitedChanged,
                            values: List<int>.generate(
                              listOptions.length + 1,
                              (i) => i++,
                            ),
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
      withColor: true,
    );
  }
}
