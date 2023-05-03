import 'package:flutter/material.dart';
import 'package:survey_admin/presentation/app/localization/app_localizations_ext.dart';
import 'package:survey_admin/presentation/widgets/customization_items/color_customization_item.dart';
import 'package:survey_admin/presentation/widgets/customization_items/customization_items_container.dart';
import 'package:survey_admin/presentation/widgets/customization_items/radius_customization_item.dart';
import 'package:survey_admin/presentation/widgets/customization_items/text_style_customization_item.dart';
import 'package:survey_admin/presentation/widgets/customization_panel/customization_tab.dart';
import 'package:survey_core/survey_core.dart';

class ChoiceCommonCustomizationTab extends CustomizationTab {
  final void Function(QuestionData data) onChange;
  final ChoiceQuestionData editable;

  const ChoiceCommonCustomizationTab({
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
          title: context.localization.fill,
          shouldShowTopDivider: true,
          children: [
            ColorCustomizationItem(
              initialColor: theme.fill,
              onColorPicked: (color) => onChange(
                editable.copyWith(
                  theme: theme.copyWith(fill: color),
                ),
              ),
            ),
          ],
        ),
        CustomizationItemsContainer(
          title: context.localization.title,
          children: [
            TextStyleCustomizationItem(
              initialColor: theme.titleColor,
              onColorPicked: (color) => onChange(
                editable.copyWith(
                  theme: theme.copyWith(titleColor: color),
                ),
              ),
              initialSize: theme.titleSize,
              onSizeChanged: (size) => onChange(
                editable.copyWith(
                  theme: theme.copyWith(titleSize: size),
                ),
              ),
            ),
          ],
        ),
        CustomizationItemsContainer(
          title: context.localization.subtitle,
          children: [
            TextStyleCustomizationItem(
              initialColor: theme.subtitleColor,
              onColorPicked: (color) => onChange(
                editable.copyWith(
                  theme: theme.copyWith(subtitleColor: color),
                ),
              ),
              initialSize: theme.subtitleSize,
              onSizeChanged: (size) => onChange(
                editable.copyWith(
                  theme: theme.copyWith(subtitleSize: size),
                ),
              ),
            ),
          ],
        ),
        CustomizationItemsContainer(
          title: context.localization.primaryButton,
          children: [
            ColorCustomizationItem(
              initialColor: theme.primaryButtonFill,
              onColorPicked: (color) => onChange(
                editable.copyWith(
                  theme: theme.copyWith(primaryButtonFill: color),
                ),
              ),
            ),
            TextStyleCustomizationItem(
              initialColor: theme.primaryButtonTextColor,
              onColorPicked: (color) => onChange(
                editable.copyWith(
                  theme: theme.copyWith(primaryButtonTextColor: color),
                ),
              ),
              initialSize: theme.primaryButtonTextSize,
              onSizeChanged: (size) => onChange(
                editable.copyWith(
                  theme: theme.copyWith(primaryButtonTextSize: size),
                ),
              ),
            ),
            RadiusCustomizationItem(
              initialValue: theme.primaryButtonRadius,
              onRadiusChanged: (radius) => onChange(
                editable.copyWith(
                  theme: theme.copyWith(primaryButtonRadius: radius),
                ),
              ),
            ),
          ],
        ),
        if (editable.isSkip)
          CustomizationItemsContainer(
            title: context.localization.secondaryButton,
            children: [
              ColorCustomizationItem(
                initialColor: theme.secondaryButtonFill,
                onColorPicked: (color) => onChange(
                  editable.copyWith(
                    theme: theme.copyWith(secondaryButtonFill: color),
                  ),
                ),
              ),
              TextStyleCustomizationItem(
                initialColor: theme.secondaryButtonTextColor,
                onColorPicked: (color) => onChange(
                  editable.copyWith(
                    theme: theme.copyWith(secondaryButtonTextColor: color),
                  ),
                ),
                initialSize: theme.secondaryButtonTextSize,
                onSizeChanged: (size) => onChange(
                  editable.copyWith(
                    theme: theme.copyWith(secondaryButtonTextSize: size),
                  ),
                ),
              ),
              RadiusCustomizationItem(
                initialValue: theme.secondaryButtonRadius,
                onRadiusChanged: (radius) => onChange(
                  editable.copyWith(
                    theme: theme.copyWith(secondaryButtonRadius: radius),
                  ),
                ),
              ),
            ],
          ),
      ],
    );
  }
}
