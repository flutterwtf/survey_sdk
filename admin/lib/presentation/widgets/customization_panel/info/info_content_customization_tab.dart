import 'package:flutter/material.dart';
import 'package:survey_admin/presentation/app/localization/app_localizations_ext.dart';
import 'package:survey_admin/presentation/utils/utils.dart';
import 'package:survey_admin/presentation/widgets/customization_items/customization_items_container.dart';
import 'package:survey_admin/presentation/widgets/customization_items/customization_multiline_text_field.dart';
import 'package:survey_admin/presentation/widgets/customization_items/secondary_button_customization_item.dart';
import 'package:survey_admin/presentation/widgets/customization_panel/customization_tab.dart';
import 'package:survey_sdk/survey_sdk.dart';

class InfoContentCustomizationTab extends CustomizationTab {
  final ValueChanged<QuestionData> onChange;
  final InfoQuestionData editable;

  const InfoContentCustomizationTab({
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
