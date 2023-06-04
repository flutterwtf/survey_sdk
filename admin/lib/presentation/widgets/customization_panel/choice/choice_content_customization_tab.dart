import 'package:flutter/material.dart';
import 'package:survey_admin/presentation/app/localization/app_localizations_ext.dart';
import 'package:survey_admin/presentation/widgets/base/customization_tab.dart';
import 'package:survey_admin/presentation/widgets/customization_items/customization_items_container.dart';
import 'package:survey_admin/presentation/widgets/customization_items/customization_multiline_text_field.dart';
import 'package:survey_admin/presentation/widgets/customization_items/dropdown_customization_button.dart';
import 'package:survey_admin/presentation/widgets/customization_items/option_customization_item.dart';
import 'package:survey_admin/presentation/widgets/customization_items/secondary_button_customization_item.dart';
import 'package:survey_sdk/survey_sdk.dart';

class ChoiceContentCustomizationTab extends CustomizationTab {
  final ValueChanged<QuestionData> onChange;
  final ChoiceQuestionData editable;

  const ChoiceContentCustomizationTab({
    required this.onChange,
    required super.title,
    required this.editable,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        CustomizationItemsContainer(
          title: context.localization.title,
          shouldShowTopDivider: true,
          children: [
            CustomizationMultilineTextField(
              value: editable.title,
              maxHeight: SurveyDimensions.sizeXL,
              onChanged: (title) => onChange(
                editable.copyWith(title: title),
              ),
            ),
          ],
        ),
        CustomizationItemsContainer(
          title: context.localization.subtitle,
          children: [
            CustomizationMultilineTextField(
              value: editable.subtitle,
              maxHeight: SurveyDimensions.sizeXL,
              onChanged: (subtitle) => onChange(
                editable.copyWith(subtitle: subtitle),
              ),
            ),
          ],
        ),
        CustomizationItemsContainer(
          title: context.localization.options,
          children: [
            OptionCustomizationItem(
              options: editable.options,
              ruleValue: editable.ruleValue,
              onChanged: (options, ruleValue) => onChange(
                editable.copyWith(options: options, ruleValue: ruleValue),
              ),
            ),
          ],
        ),
        if (editable.isMultipleChoice)
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
                              onChange: (rule) => onChange(
                                editable.copyWith(ruleType: rule),
                              ),
                              child: Text(
                                e.name,
                                style: context.theme.textTheme.bodyLarge,
                              ),
                            ),
                          )
                          .toList(),
                      value: editable.ruleType,
                      withColor: true,
                    ),
                  ),
                  const SizedBox(width: SurveyDimensions.marginXS),
                  Expanded(
                    child: editable.ruleType != RuleType.none
                        ? _RuleDropdown(
                            onChanged: (ruleValue) => onChange(
                              editable.copyWith(ruleValue: ruleValue),
                            ),
                            values: List<int>.generate(
                              editable.options.length + 1,
                              (i) => i++,
                            ),
                            value: editable.ruleValue,
                          )
                        : const SizedBox(),
                  ),
                ],
              ),
            ],
          ),
        CustomizationItemsContainer(
          title: context.localization.primaryButton,
          children: [
            CustomizationMultilineTextField(
              value: editable.primaryButtonText,
              maxHeight: SurveyDimensions.maxTextFieldHeight,
              onChanged: (text) => onChange(
                editable.copyWith(primaryButtonText: text),
              ),
            ),
          ],
        ),
        CustomizationItemsContainer(
          itemsPadding: const EdgeInsets.all(
            SurveyDimensions.marginM,
          ),
          children: [
            SecondaryButtonCustomizationItem(
              isShown: editable.isSkip,
              onChanged: ({required isShown, required text}) => onChange(
                editable.copyWith(isSkip: isShown, secondaryButtonText: text),
              ),
              initialText: editable.secondaryButtonText,
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
