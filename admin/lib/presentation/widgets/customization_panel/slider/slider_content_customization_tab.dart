import 'package:flutter/material.dart';
import 'package:survey_admin/presentation/app/localization/app_localizations_ext.dart';
import 'package:survey_admin/presentation/widgets/base/customization_tab.dart';
import 'package:survey_admin/presentation/widgets/customization_items/actions_customization_item.dart';
import 'package:survey_admin/presentation/widgets/customization_items/customization_items_container.dart';
import 'package:survey_admin/presentation/widgets/customization_items/customization_multiline_text_field.dart';
import 'package:survey_admin/presentation/widgets/customization_items/divisions_customization_item.dart';
import 'package:survey_admin/presentation/widgets/customization_items/min_max_customization_item.dart';
import 'package:survey_admin/presentation/widgets/customization_items/secondary_button_customization_item.dart';
import 'package:survey_sdk/survey_sdk.dart';

class SliderContentCustomizationTab extends CustomizationTab {
  final ValueChanged<QuestionData> onChange;
  final SliderQuestionData editable;
  final int questionsAmount;

  const SliderContentCustomizationTab({
    required this.onChange,
    required super.title,
    required this.editable,
    required this.questionsAmount,
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
          title: context.localization.value,
          children: [
            MinMaxCustomizationItem(
              initialMax: editable.maxValue,
              initialMin: editable.minValue,
              onChanged: (min, max) => onChange(
                editable.copyWith(
                  minValue: min,
                  maxValue: max,
                  initialValue: min,
                  divisions: max - min,
                ),
              ),
            ),
          ],
        ),
        CustomizationItemsContainer(
          title: context.localization.divisions,
          children: [
            DivisionsCustomizationItem(
              maxValue: editable.maxValue - editable.minValue,
              initialValue: editable.divisions,
              onChanged: (divisions) => onChange(
                editable.copyWith(divisions: divisions),
              ),
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
        CustomizationItemsContainer(
          title: context.localization.primaryButtonAction,
          itemsPadding: EdgeInsets.zero,
          children: [
            ActionsCustomizationItem(
              onChanged: (action) => onChange(
                editable.copyWith(
                  clearMainAction: true,
                  mainButtonAction: action,
                ),
              ),
              surveyAction: editable.mainButtonAction,
              callbackType: CallbackType.primaryCallback,
              questionsLength: questionsAmount,
            ),
          ],
        ),
        if (editable.isSkip)
          CustomizationItemsContainer(
            title: context.localization.secondaryButtonAction,
            itemsPadding: EdgeInsets.zero,
            children: [
              ActionsCustomizationItem(
                onChanged: (action) => onChange(
                  editable.copyWith(
                    clearSecondaryAction: true,
                    secondaryButtonAction: action,
                  ),
                ),
                surveyAction: editable.secondaryButtonAction,
                callbackType: CallbackType.secondaryCallback,
                questionsLength: questionsAmount,
              ),
            ],
          ),
      ],
    );
  }
}
