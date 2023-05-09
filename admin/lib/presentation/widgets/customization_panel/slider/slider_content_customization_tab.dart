import 'package:flutter/material.dart';
import 'package:survey_admin/presentation/app/localization/app_localizations_ext.dart';
import 'package:survey_admin/presentation/utils/utils.dart';
import 'package:survey_admin/presentation/widgets/customization_items/customization_items_container.dart';
import 'package:survey_admin/presentation/widgets/customization_items/customization_multiline_text_field.dart';
import 'package:survey_admin/presentation/widgets/customization_items/divisions_customization_item.dart';
import 'package:survey_admin/presentation/widgets/customization_items/min_max_customization_item.dart';
import 'package:survey_admin/presentation/widgets/customization_items/secondary_button_customization_item.dart';
import 'package:survey_admin/presentation/widgets/customization_panel/customization_tab.dart';
import 'package:survey_sdk/survey_sdk.dart';

class SliderContentCustomizationTab extends CustomizationTab {
  final ValueChanged<QuestionData> onChange;
  final SliderQuestionData editable;

  const SliderContentCustomizationTab({
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
              maxHeight: AppDimensions.sizeXL,
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
              maxHeight: AppDimensions.sizeXL,
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
                ),
              ),
            ),
          ],
        ),
        CustomizationItemsContainer(
          title: context.localization.divisions,
          children: [
            DivisionsCustomizationItem(
              initialValue: editable.initialValue,
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
              maxHeight: AppDimensions.maxTextFieldHeight,
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
