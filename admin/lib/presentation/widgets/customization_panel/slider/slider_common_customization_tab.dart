import 'package:flutter/material.dart';
import 'package:survey_admin/presentation/app/localization/app_localizations_ext.dart';
import 'package:survey_admin/presentation/widgets/customization_items/color_customization_item.dart';
import 'package:survey_admin/presentation/widgets/customization_items/customization_items_container.dart';
import 'package:survey_admin/presentation/widgets/customization_items/radius_customization_item.dart';
import 'package:survey_admin/presentation/widgets/customization_items/text_style_customization_item.dart';
import 'package:survey_admin/presentation/widgets/customization_panel/customization_tab.dart';
import 'package:survey_core/survey_core.dart';

class SliderCommonCustomizationTab extends CustomizationTab {
  final ValueChanged<QuestionData> onChange;
  final SliderQuestionData editable;

  const SliderCommonCustomizationTab({
    required this.onChange,
    required super.title,
    required this.editable,
    super.key,
  });

  SliderQuestionTheme get theme =>
      editable.theme ?? const SliderQuestionTheme.common();

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
          title: context.localization.button,
          children: [
            TextStyleCustomizationItem(
              initialColor: theme.buttonTextColor,
              onColorPicked: (color) => onChange(
                editable.copyWith(
                  theme: theme.copyWith(buttonTextColor: color),
                ),
              ),
              initialSize: theme.buttonTextSize,
              onSizeChanged: (size) => onChange(
                editable.copyWith(
                  theme: theme.copyWith(buttonTextSize: size),
                ),
              ),
            ),
            RadiusCustomizationItem(
              initialValue: theme.buttonRadius,
              onRadiusChanged: (radius) => onChange(
                editable.copyWith(
                  theme: theme.copyWith(buttonRadius: radius),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
