import 'package:flutter/material.dart';
import 'package:survey_admin/presentation/app/localization/localizations.dart';
import 'package:survey_admin/presentation/utils/constants/constants.dart';
import 'package:survey_admin/presentation/widgets/customization_items/create_text_customization_item.dart';
import 'package:survey_admin/presentation/widgets/customization_items/customization_items_container.dart';
import 'package:survey_admin/presentation/widgets/customization_items/drop_down_customization_item.dart';
import 'package:survey_admin/presentation/widgets/customization_items/option_customization_item.dart';
import 'package:survey_admin/presentation/widgets/customization_panel/customization_tab.dart';
import 'package:survey_core/survey_core.dart';

enum RuleType {
  none('None'),
  more('>'),
  less('<'),
  moreOrEqual('>='),
  lessOrEqual('<='),
  equal('=');

  const RuleType(
    this.name,
  );

  final String name;
}

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
            CreateTextCustomizationItem(
              maxHeight: AppDimensions.sizeXL,
              onChanged: onTitleChanged,
            )
          ],
        ),
        CustomizationItemsContainer(
          title: context.localization.subtitle,
          children: [
            CreateTextCustomizationItem(
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
                    child: DropDownCustomizationItem<RuleType>(
                      initialValue: ruleType,
                      onChanged: onRuleChanged,
                      itemList: RuleType.values,
                    ),
                  ),
                  Expanded(
                    child: ruleType != RuleType.none
                        ? DropDownCustomizationItem<int>(
                            onChanged: onRuleLimitedChanged,
                            itemList: initialLimitedList(listOptions),
                            initialValue: limitedRule,
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
