import 'package:flutter/material.dart';
import 'package:survey_admin/presentation/app/localization/app_localizations_ext.dart';
import 'package:survey_admin/presentation/utils/utils.dart';
import 'package:survey_admin/presentation/widgets/customization_items/color_customization_item.dart';
import 'package:survey_admin/presentation/widgets/customization_items/customization_items_container.dart';
import 'package:survey_admin/presentation/widgets/customization_items/text_style_customization_item.dart';
import 'package:survey_admin/presentation/widgets/customization_items/thickness_customization_item.dart';
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

  @override
  State<CustomizationTab> createState() => SliderCustomizationTabState();
}

class SliderCustomizationTabState
    extends CustomizationTabState<SliderCustomizationTab> {
  @override
  Widget build(BuildContext context) {
    final theme = widget.editable.theme ?? const SliderQuestionTheme.common();
    return ListView(
      children: [
        CustomizationItemsContainer(
          title: context.localization.thickness,
          isTopDividerShown: true,
          children: [
            ThicknessCustomizationItem(
              onThicknessChanged: (value) {
                if (value == null) return;
                // TODO(dev): replace with onSizeChanged?
                final thickness = double.tryParse(value);
                if (thickness != null) {
                  widget.onChange(
                    widget.editable.copyWith(
                      theme: theme.copyWith(thickness: thickness),
                    ),
                  );
                }
              },
              initialSize: AppFonts.sizeL,
            ),
          ],
        ),
        CustomizationItemsContainer(
          title: context.localization.active,
          children: [
            ColorCustomizationItem(
              initialColor: AppColors.switchBackgroundActive,
              onColorPicked: (color) => widget.onChange(
                widget.editable.copyWith(
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
              initialColor: AppColors.switchBackgroundInactive,
              onColorPicked: (color) => widget.onChange(
                widget.editable.copyWith(
                  theme: theme.copyWith(inactiveColor: color),
                ),
              ),
            ),
          ],
        ),
        CustomizationItemsContainer(
          title: context.localization.thumb,
          children: [
            TextStyleCustomizationItem(
              initialColor: AppColors.textHintGrey,
              onColorPicked: (color) => widget.onChange(
                widget.editable.copyWith(
                  theme: theme.copyWith(thumbColor: color),
                ),
              ),
              initialSize: AppFonts.sizeL,
              onSizeChanged: (radius) => widget.onChange(
                widget.editable.copyWith(
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
