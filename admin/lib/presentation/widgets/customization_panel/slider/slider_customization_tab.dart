import 'package:flutter/material.dart';
import 'package:survey_admin/presentation/app/localization/localizations.dart';
import 'package:survey_admin/presentation/utils/app_fonts.dart';
import 'package:survey_admin/presentation/utils/colors.dart';
import 'package:survey_admin/presentation/widgets/customization_items/color_customization_item.dart';
import 'package:survey_admin/presentation/widgets/customization_items/customization_items_container.dart';
import 'package:survey_admin/presentation/widgets/customization_items/thickness_customization_item.dart';
import 'package:survey_admin/presentation/widgets/customization_panel/customization_tab.dart';

class SliderCustomizationTab extends CustomizationTab {
  final ValueChanged<int> onThicknessChanged;
  final ValueChanged<Color> onActiveColorChanged;
  final ValueChanged<Color> onInactiveColorChanged;
  final ValueChanged<Color> onThumbColorChanged;
  final ValueChanged<int> onThumbSizeChanged;

  const SliderCustomizationTab({
    required super.title,
    required this.onActiveColorChanged,
    required this.onInactiveColorChanged,
    required this.onThicknessChanged,
    required this.onThumbSizeChanged,
    required this.onThumbColorChanged,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        CustomizationItemsContainer(
          title: context.localization.thickness,
          isTopDividerShown: true,
          children: [
            ThicknessCustomizationItem(
              onThicknessChanged: (value) {
                if (value == null) return;

                final thickness = int.tryParse(value);
                if (thickness != null) {
                  onThicknessChanged(thickness);
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
              onColorPicked: onActiveColorChanged,
            )
          ],
        ),
        CustomizationItemsContainer(
          title: context.localization.inactive,
          children: [
            ColorCustomizationItem(
              initialColor: AppColors.switchBackgroundInactive,
              onColorPicked: onInactiveColorChanged,
            )
          ],
        ),
        CustomizationItemsContainer(
          title: context.localization.thumb,
          children: [
            Row(
              children: [
                Expanded(
                  child: ColorCustomizationItem(
                    initialColor: AppColors.switchBackgroundActive,
                    onColorPicked: onThumbColorChanged,
                  ),
                ),
                Expanded(
                  child: ThicknessCustomizationItem(
                    onThicknessChanged: (value) {
                      if (value == null) return;

                      final size = int.tryParse(value);
                      if (size != null) {
                        onThumbSizeChanged(size);
                      }
                    },
                    initialSize: AppFonts.sizeL,
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}