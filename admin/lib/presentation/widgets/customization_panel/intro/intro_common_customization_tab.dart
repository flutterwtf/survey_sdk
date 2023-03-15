import 'package:flutter/material.dart';
import 'package:survey_admin/presentation/app/localization/localizations.dart';
import 'package:survey_admin/presentation/utils/app_fonts.dart';
import 'package:survey_admin/presentation/utils/colors.dart';
import 'package:survey_admin/presentation/utils/constants/app_dimensions.dart';

import 'package:survey_admin/presentation/widgets/customization_items/color_customization_item.dart';
import 'package:survey_admin/presentation/widgets/customization_items/customization_items_container.dart';
import 'package:survey_admin/presentation/widgets/customization_items/radius_customization_item.dart';
import 'package:survey_admin/presentation/widgets/customization_items/text_style_customization_item.dart';
import 'package:survey_admin/presentation/widgets/customization_panel/customization_tab.dart';

class IntroCommonCustomizationTab extends CustomizationTab {
  final ValueChanged<Color> onFillColorPicked;
  final ValueChanged<Color> onTitleColorPicked;
  final ValueChanged<int> onTitleFontSizeChanged;
  final ValueChanged<Color> onSubtitleColorPicked;
  final ValueChanged<int> onSubtitleFontSizeChanged;
  final ValueChanged<Color> onButtonColorPicked;
  final ValueChanged<Color> onButtonTextColorPicked;
  final ValueChanged<int> onButtonFontSizeChanged;
  final ValueChanged<int> onButtonRadiusChanged;

  const IntroCommonCustomizationTab({
    required super.title,
    required this.onFillColorPicked,
    required this.onTitleColorPicked,
    required this.onTitleFontSizeChanged,
    required this.onSubtitleColorPicked,
    required this.onSubtitleFontSizeChanged,
    required this.onButtonColorPicked,
    required this.onButtonTextColorPicked,
    required this.onButtonFontSizeChanged,
    required this.onButtonRadiusChanged,
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
            TextStyleCustomizationItem(
              initialColor: AppColors.black,
              onColorPicked: onTitleColorPicked,
              initialFontSize: AppFonts.sizeL.toString(),
              onFontSizeChanged: (value) {
                final size = int.tryParse(value);
                if (size != null) {
                  onTitleFontSizeChanged(size);
                }
              },
            ),
          ],
        ),
        CustomizationItemsContainer(
          title: context.localization.subtitle,
          children: [
            TextStyleCustomizationItem(
              initialColor: AppColors.black,
              onColorPicked: onSubtitleColorPicked,
              initialFontSize: AppFonts.sizeS.toString(),
              onFontSizeChanged: (value) {
                final size = int.tryParse(value);
                if (size != null) {
                  onSubtitleFontSizeChanged(size);
                }
              },
            ),
          ],
        ),
        CustomizationItemsContainer(
          title: context.localization.button,
          children: [
            ColorCustomizationItem(
              initialColor: AppColors.black,
              onColorPicked: onButtonColorPicked,
            ),
            TextStyleCustomizationItem(
              initialColor: AppColors.white,
              onColorPicked: onButtonTextColorPicked,
              initialFontSize: AppFonts.sizeS.toString(),
              onFontSizeChanged: (value) {
                final size = int.tryParse(value);
                if (size != null) {
                  onButtonFontSizeChanged(size);
                }
              },
            ),
            RadiusCustomizationItem(
              initialValue: AppDimensions.circularRadiusS,
              onRadiusChanged: onButtonRadiusChanged,
            ),
          ],
        ),
      ],
    );
  }
}
