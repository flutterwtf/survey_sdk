import 'package:flutter/material.dart';
import 'package:survey_admin/presentation/app/localization/localizations.dart';
import 'package:survey_admin/presentation/utils/app_fonts.dart';
import 'package:survey_admin/presentation/utils/colors.dart';
import 'package:survey_admin/presentation/utils/constants/app_dimensions.dart';
import 'package:survey_admin/presentation/widgets/customization_items/color_customization_item.dart';
import 'package:survey_admin/presentation/widgets/customization_items/customization_items_container.dart';
import 'package:survey_admin/presentation/widgets/customization_items/radius_customization_item.dart';
import 'package:survey_admin/presentation/widgets/customization_panel/customization_tab.dart';

class ChoiceCommonCustomizationTab extends CustomizationTab {
  final ValueChanged<Color> onFillColorPicked;
  final ValueChanged<Color> onTitleColorPicked;
  final ValueChanged<double> onTitleFontSizeChanged;
  final ValueChanged<Color> onSubtitleColorPicked;
  final ValueChanged<double> onSubtitleFontSizeChanged;
  final ValueChanged<Color> onButtonColorPicked;
  final ValueChanged<double> onButtonFontSizeChanged;
  final ValueChanged<int> onButtonRadiusChanged;

  const ChoiceCommonCustomizationTab({
    required super.title,
    required this.onFillColorPicked,
    required this.onTitleColorPicked,
    required this.onTitleFontSizeChanged,
    required this.onSubtitleColorPicked,
    required this.onSubtitleFontSizeChanged,
    required this.onButtonColorPicked,
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
              initialSize: AppFonts.sizeS.toString(),
              onSizeChanged: onSubtitleFontSizeChanged,
            ),
          ],
        ),
        CustomizationItemsContainer(
          title: context.localization.button,
          children: [
            ColorCustomizationItem(
              initialColor: AppColors.black,
              onColorPicked: onButtonColorPicked,
              initialSize: AppFonts.sizeS.toString(),
              onSizeChanged: onButtonFontSizeChanged,
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
