import 'package:flutter/cupertino.dart';
import 'package:survey_admin/presentation/app/localization/app_localizations_ext.dart';
import 'package:survey_admin/presentation/utils/app_fonts.dart';
import 'package:survey_admin/presentation/utils/app_colors.dart';
import 'package:survey_admin/presentation/widgets/customization_items/color_customization_item.dart';
import 'package:survey_admin/presentation/widgets/customization_items/customization_items_container.dart';
import 'package:survey_admin/presentation/widgets/customization_panel/customization_tab.dart';

class InputCommonCustomizationTab extends CustomizationTab {
  final ValueChanged<Color> onFillColorPicked;
  final ValueChanged<Color> onTitleColorPicked;
  final ValueChanged<double> onTitleFontSizeChanged;
  final ValueChanged<Color> onSubtitleColorPicked;
  final ValueChanged<double> onSubtitleFontSizeChanged;
  final ValueChanged<Color> onButtonFirstColorPicked;
  final ValueChanged<Color> onButtonSecondColorPicked;
  final ValueChanged<double> onButtonFontSizeChanged;

  const InputCommonCustomizationTab({
    required super.title,
    required this.onFillColorPicked,
    required this.onTitleColorPicked,
    required this.onTitleFontSizeChanged,
    required this.onSubtitleColorPicked,
    required this.onSubtitleFontSizeChanged,
    required this.onButtonFirstColorPicked,
    required this.onButtonSecondColorPicked,
    required this.onButtonFontSizeChanged,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final fontSize = AppFonts.sizeS.toString();
    return ListView(
      children: [
        CustomizationItemsContainer(
          title: context.localization.fill,
          isTopDividerShown: true,
          children: [
            ColorCustomizationItem(
              initialColor: AppColors.black,
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
              initialSize: AppFonts.sizeL.toString(),
              onSizeChanged: onTitleFontSizeChanged,
            ),
          ],
        ),
        CustomizationItemsContainer(
          title: context.localization.subtitle,
          children: [
            ColorCustomizationItem(
              initialColor: AppColors.black,
              onColorPicked: onSubtitleColorPicked,
              initialSize: fontSize,
              onSizeChanged: onSubtitleFontSizeChanged,
            ),
          ],
        ),
        CustomizationItemsContainer(
          title: context.localization.button,
          children: [
            ColorCustomizationItem(
              initialColor: AppColors.black,
              onColorPicked: onButtonFirstColorPicked,
            ),
            ColorCustomizationItem(
              initialColor: AppColors.white,
              onColorPicked: onButtonSecondColorPicked,
              initialSize: fontSize,
              onSizeChanged: onButtonFontSizeChanged,
            ),
          ],
        ),
      ],
    );
  }
}
