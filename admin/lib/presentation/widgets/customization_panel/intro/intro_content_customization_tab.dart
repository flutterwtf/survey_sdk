import 'package:flutter/material.dart';
import 'package:survey_admin/presentation/app/localization/app_localizations_ext.dart';
import 'package:survey_admin/presentation/utils/utils.dart';
import 'package:survey_admin/presentation/widgets/customization_items/customization_items_container.dart';
import 'package:survey_admin/presentation/widgets/customization_items/customization_multiline_text_field.dart';
import 'package:survey_admin/presentation/widgets/customization_items/secondary_button_customization_item.dart';
import 'package:survey_admin/presentation/widgets/customization_panel/customization_tab.dart';
import 'package:survey_core/survey_core.dart';

class IntroContentCustomizationTab extends CustomizationTab {
  final ValueChanged<QuestionData> onChange;
  final IntroQuestionData editable;

  const IntroContentCustomizationTab({
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
              maxHeight: AppDimensions.sizeL,
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
              maxHeight: AppDimensions.sizeL,
              onChanged: (subtitle) => onChange(
                editable.copyWith(subtitle: subtitle),
              ),
            ),
          ],
        ),
        CustomizationItemsContainer(
          title: context.localization.primaryButton,
          children: [
            CustomizationMultilineTextField(
              value: editable.primaryButtonText,
              maxHeight: AppDimensions.sizeL,
              onChanged: (text) => onChange(
                editable.copyWith(primaryButtonText: text),
              ),
            ),
          ],
        ),
        CustomizationItemsContainer(
          itemsPadding: const EdgeInsets.all(
            AppDimensions.marginM,
          ),
          children: [
            SecondaryButtonCustomizationItem(
              onChanged: (canSkip, title) => onChange(
                editable.copyWith(isSkip: canSkip, secondaryButtonText: title),
              ),
              initialText: editable.secondaryButtonText,
            ),
          ],
        ),
      ],
    );
  }
}
