import 'package:flutter/material.dart';
import 'package:survey_admin/presentation/app/localization/app_localizations_ext.dart';
import 'package:survey_admin/presentation/widgets/customization_items/color_customization_item.dart';
import 'package:survey_admin/presentation/widgets/customization_items/color_thickness_customization_item.dart';
import 'package:survey_admin/presentation/widgets/customization_items/customization_items_container.dart';
import 'package:survey_admin/presentation/widgets/customization_items/thickness_customization_item.dart';
import 'package:survey_admin/presentation/widgets/customization_panel/constants/customization_panel_dimensions.dart';
import 'package:survey_admin/presentation/widgets/customization_panel/customization_tab.dart';
import 'package:survey_core/survey_core.dart';

class SliderCustomizationTab extends CustomizationTab {
  final void Function(QuestionData data) onChange;
  final SliderQuestionData editable;

  const SliderCustomizationTab({
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
          title: context.localization.thickness,
          shouldShowTopDivider: true,
          children: [
            ThicknessCustomizationItem(
              maxThickness:
                  CustomizationPanelDimensions.sliderThicknessMaxValue,
              onThicknessChanged: (value) {
                onChange(
                  editable.copyWith(
                    theme: theme.copyWith(thickness: value),
                  ),
                );
              },
              initialSize: theme.thickness,
            ),
          ],
        ),
        CustomizationItemsContainer(
          title: context.localization.active,
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
          title: context.localization.thumb,
          children: [
            ColorThicknessCustomizationItem(
              initialColor: theme.thumbColor,
              onColorPicked: (color) => onChange(
                editable.copyWith(
                  theme: theme.copyWith(thumbColor: color),
                ),
              ),
              initialThickness: theme.thumbRadius,
              maxThickness: CustomizationPanelDimensions.sliderThumbMaxRadius,
              onThicknessChanged: (radius) => onChange(
                editable.copyWith(
                  theme: theme.copyWith(thumbRadius: radius),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
