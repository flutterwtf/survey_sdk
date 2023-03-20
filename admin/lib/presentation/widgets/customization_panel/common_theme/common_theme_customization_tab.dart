import 'package:flutter/material.dart';
import 'package:survey_admin/presentation/app/localization/localizations.dart';
import 'package:survey_admin/presentation/utils/app_fonts.dart';
import 'package:survey_admin/presentation/utils/colors.dart';
import 'package:survey_admin/presentation/widgets/customization_items/color_customization_item.dart';
import 'package:survey_admin/presentation/widgets/customization_items/customization_items_container.dart';
import 'package:survey_admin/presentation/widgets/customization_panel/customization_tab.dart';

class CommonThemeCustomizationTab extends CustomizationTab {
  final ValueChanged<Color> onFillColorPicked;
  final ValueChanged<Color> onTitleColorPicked;
  final ValueChanged<double> onTitleFontSizeChanged;
  final ValueChanged<Color> onSubtitleColorPicked;
  final ValueChanged<double> onSubtitleFontSizeChanged;

  const CommonThemeCustomizationTab({
    required super.title,
    required this.onFillColorPicked,
    required this.onTitleColorPicked,
    required this.onSubtitleFontSizeChanged,
    required this.onSubtitleColorPicked,
    required this.onTitleFontSizeChanged,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        CustomizationItemsContainer(
          title: context.localization.fill,
          isTopDividerShown: true,
          children: [
            ColorCustomizationItem(
              initialColor: AppColors.white,
              onColorPicked: onFillColorPicked,
            ),
          ],
        ),
        CustomizationItemsContainer(
          title: context.localization.title,
          children: [
            ColorCustomizationItem(
              initialColor: AppColors.black,
              onColorPicked: onTitleColorPicked,
              onSizeChanged: onTitleFontSizeChanged,
            ),
          ],
        ),
        CustomizationItemsContainer(
          title: context.localization.subtitle,
          children: [
            ColorCustomizationItem(
              onColorPicked: onSubtitleColorPicked,
              initialColor: AppColors.black,
              initialSize: AppFonts.sizeS.toString(),
              onSizeChanged: onSubtitleFontSizeChanged,
            ),
          ],
        ),
      ],
    );
  }
}
