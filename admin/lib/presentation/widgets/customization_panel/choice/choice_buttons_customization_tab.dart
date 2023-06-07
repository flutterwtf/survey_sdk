import 'package:flutter/material.dart';
import 'package:survey_admin/presentation/app/localization/app_localizations_ext.dart';
import 'package:survey_admin/presentation/widgets/base/customization_tab.dart';
import 'package:survey_admin/presentation/widgets/customization_items/color_customization_item.dart';
import 'package:survey_admin/presentation/widgets/customization_items/customization_items_container.dart';
import 'package:survey_admin/presentation/widgets/customization_items/default_options_customization_item.dart';
import 'package:survey_admin/presentation/widgets/customization_items/multiple_choice_customization_item.dart';
import 'package:survey_sdk/survey_sdk.dart';

class ChoiceButtonsCustomizationTab extends CustomizationTab {
  final ValueChanged<QuestionData> onChange;
  final ChoiceQuestionData editable;

  const ChoiceButtonsCustomizationTab({
    required this.onChange,
    required super.title,
    required this.editable,
    super.key,
  });

  ChoiceQuestionTheme get theme =>
      editable.theme ?? const ChoiceQuestionTheme.common();

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        CustomizationItemsContainer(
          shouldShowTopDivider: true,
          itemsPadding: const EdgeInsets.all(
            SurveyDimensions.marginM,
          ),
          children: [
            MultipleChoiceCustomizationItem(
              value: editable.isMultipleChoice,
              onChanged: (isMultipleChoice) => onChange(
                editable.copyWith(
                  isMultipleChoice: isMultipleChoice,
                  selectedByDefault: editable.selectedByDefault != null
                      ? [editable.selectedByDefault!.first]
                      : null,
                ),
              ),
            ),
          ],
        ),
        CustomizationItemsContainer(
          title: context.localization.active,
          shouldShowTopDivider: true,
          children: [
            ColorCustomizationItem(
              initialColor: theme.activeColor,
              onColorPicked: (color) => onChange(
                editable.copyWith(
                  theme: theme.copyWith(activeColor: color),
                ),
              ),
            ),
          ],
        ),
        CustomizationItemsContainer(
          title: context.localization.inactive,
          children: [
            ColorCustomizationItem(
              initialColor: theme.inactiveColor,
              onColorPicked: (color) => onChange(
                editable.copyWith(
                  theme: theme.copyWith(inactiveColor: color),
                ),
              ),
            ),
          ],
        ),
        CustomizationItemsContainer(
          itemsPadding: const EdgeInsets.all(
            AppDimensions.marginM,
          ),
          children: [
            DefaultOptionsCustomizationItem(
              options: editable.options,
              defaultOptions: editable.selectedByDefault,
              isMultipleChoice: editable.isMultipleChoice,
              onChanged: (selectedByDefault) => onChange(
                editable.copyWith(
                  clearSelectedByDefault: selectedByDefault == null,
                  selectedByDefault: selectedByDefault ?? [],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
