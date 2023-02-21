import 'package:flutter/material.dart';
import 'package:survey_admin/presentation/utils/app_fonts.dart';
import 'package:survey_admin/presentation/utils/colors.dart';
import 'package:survey_admin/presentation/widgets/customization_items/color_customization_item.dart';
import 'package:survey_admin/presentation/widgets/customization_items/customization_items_container.dart';
import 'package:survey_admin/presentation/widgets/customization_items/thickness_customization_item.dart';
import 'package:survey_admin/presentation/widgets/customization_panel/customization_panel.dart';

class SliderCustomizationPanel extends CustomizationPanel {
  final ValueChanged<String?> onThicknessChanged;
  final ValueChanged<Color> onActiveColorChanged;
  final ValueChanged<Color> onInactiveColorChanged;
  final ValueChanged<Color> onThumbColorChanged;
  final ValueChanged<String?> onThumbChanged;

  const SliderCustomizationPanel({
    super.key,
    required super.title,
    required this.onActiveColorChanged,
    required this.onInactiveColorChanged,
    required this.onThicknessChanged,
    required this.onThumbChanged,
    required this.onThumbColorChanged,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        CustomizationItemsContainer(
          title: 'Thickness',
          children: [
            ThicknessCustomizationItem(
              onThicknessChanged: onThicknessChanged,
              initialSize: AppFonts.sizeL,
            ),
          ],
        ),
        CustomizationItemsContainer(
          title: 'Active',
          children: [
            ColorCustomizationItem(
              initialColor: AppColors.switchBackgroundActive,
              onColorPicked: onActiveColorChanged,
            )
          ],
        ),
        CustomizationItemsContainer(
          title: 'Inactive',
          children: [
            ColorCustomizationItem(
              initialColor: AppColors.switchBackgroundInactive,
              onColorPicked: onInactiveColorChanged,
            )
          ],
        ),
        CustomizationItemsContainer(
          title: 'Thumb',
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
                    onThicknessChanged: onThumbChanged,
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
