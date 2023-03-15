import 'package:flutter/material.dart';
import 'package:survey_admin/presentation/app/localization/localizations.dart';
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
  final int limitedRule;
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
    required this.limitedRule,
    super.key,
  });

  List<int> initialLimitedList(List<String> listOptions) {
    final listLimited = <int>[];
    if (listOptions.isEmpty) {
      listLimited.add(0);
    } else {
      for (var i = 0; i <= listOptions.length; i++) {
        listLimited.add(i);
      }
    }
    return listLimited;
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
            )
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
            )
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
                    ),
                  ),
                  Expanded(
                    child: ruleType != RuleType.none
                        ? DropdownCustomizationButton<int>(
                            items: initialLimitedList(listOptions)
                                .map(
                                  (e) => DropdownCustomizationItem<int>(
                                    value: e,
                                    onChange: onRuleLimitedChanged,
                                    child: Text(
                                      e.toString(),
                                      style: context.theme.textTheme.bodyLarge,
                                    ),
                                  ),
                                )
                                .toList(),
                            value: limitedRule,
                          )
                        : const SizedBox(),
                  ),
                ],
              ),
            ],
          )
        else
          Container(),
      ],
    );
  }
}
