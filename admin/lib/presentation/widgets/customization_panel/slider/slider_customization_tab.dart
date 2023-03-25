import 'package:flutter/material.dart';
import 'package:survey_admin/presentation/app/localization/app_localizations_ext.dart';
import 'package:survey_admin/presentation/utils/utils.dart';
import 'package:survey_admin/presentation/widgets/customization_items/color_customization_item.dart';
import 'package:survey_admin/presentation/widgets/customization_items/customization_items_container.dart';
import 'package:survey_admin/presentation/widgets/customization_items/thickness_customization_item.dart';
import 'package:survey_admin/presentation/widgets/customization_panel/customization_tab.dart';

class SliderCustomizationTab extends CustomizationTab {
  final ValueChanged<int> onThicknessChanged;
  final ValueChanged<Color> onActiveColorChanged;
  final ValueChanged<Color> onInactiveColorChanged;
  final ValueChanged<Color> onThumbColorChanged;

  const SliderCustomizationTab({
    required super.title,
    required this.onActiveColorChanged,
    required this.onInactiveColorChanged,
    required this.onThicknessChanged,
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
              onThicknessChanged: (value) => SizeHandler.onIntSizeChanged(
                value,
                onThicknessChanged,
              ),
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
            ),
          ],
        ),
        CustomizationItemsContainer(
          title: context.localization.inactive,
          children: [
            ColorCustomizationItem(
              initialColor: AppColors.switchBackgroundInactive,
              onColorPicked: onInactiveColorChanged,
            ),
          ],
        ),
        CustomizationItemsContainer(
          title: context.localization.thumb,
          children: [
            ColorCustomizationItem(
              initialColor: AppColors.textHintGrey,
              onColorPicked: onThumbColorChanged,
              decoration: InputDecoration(
                isCollapsed: true,
                border: InputBorder.none,
                suffixText: context.localization.px,
                suffixStyle: context.theme.textTheme.bodyLarge,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
