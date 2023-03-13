import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:survey_admin/presentation/app/localization/localizations.dart';
import 'package:survey_admin/presentation/utils/app_fonts.dart';
import 'package:survey_admin/presentation/utils/colors.dart';
import 'package:survey_admin/presentation/utils/constants/app_assets.dart';
import 'package:survey_admin/presentation/utils/constants/constants.dart';
import 'package:survey_admin/presentation/widgets/customization_items/color_customization_item.dart';
import 'package:survey_admin/presentation/widgets/customization_items/customization_items_container.dart';
import 'package:survey_admin/presentation/widgets/customization_items/customization_widgets/customization_text_field.dart';
import 'package:survey_admin/presentation/widgets/customization_items/text_style_customization_item.dart';
import 'package:survey_admin/presentation/widgets/customization_panel/customization_tab.dart';

class SliderCommonCustomizationTab extends CustomizationTab {
  final ValueChanged<Color> onFillColorChanged;
  final ValueChanged<Color> onTitleColorChanged;
  final ValueChanged<Color> onSubtitleColorChanged;
  final ValueChanged<Color> onButtonUpColorChanged;
  final ValueChanged<Color> onButtonDownColorChanged;
  final ValueChanged<int> onTitleFontSizeChanged;
  final ValueChanged<int> onSubtitleFontSizeChanged;
  final ValueChanged<int> onButtonFontSizeChanged;
  final ValueChanged<int> onButtonRadiusChanged;

  const SliderCommonCustomizationTab({
    required super.title,
    required this.onButtonDownColorChanged,
    required this.onButtonUpColorChanged,
    required this.onFillColorChanged,
    required this.onSubtitleColorChanged,
    required this.onTitleColorChanged,
    required this.onTitleFontSizeChanged,
    required this.onSubtitleFontSizeChanged,
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
              onColorPicked: onFillColorChanged,
            ),
          ],
        ),
        CustomizationItemsContainer(
          title: context.localization.title,
          children: [
            TextStyleCustomizationItem(
              initialColor: AppColors.black,
              onColorPicked: onTitleColorChanged,
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
              onColorPicked: onSubtitleColorChanged,
              initialFontSize: AppFonts.sizeL.toString(),
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
              onColorPicked: onButtonUpColorChanged,
            ),
            TextStyleCustomizationItem(
              initialColor: AppColors.white,
              onColorPicked: onButtonDownColorChanged,
              initialFontSize: AppFonts.sizeL.toString(),
              onFontSizeChanged: (value) {
                final size = int.tryParse(value);
                if (size != null) {
                  onButtonFontSizeChanged(size);
                }
              },
            ),
            Row(
              children: [
                SvgPicture.asset(AppAssets.arcIcon),
                const SizedBox(width: AppDimensions.margin2XS),
                Expanded(
                  child: CustomizationTextField(
                    initialValue: AppFonts.sizeL.toString(),
                    onChanged: (value) {
                      if (value == null) return;

                      final radius = int.tryParse(value);
                      if (radius != null) {
                        onButtonRadiusChanged(radius);
                      }
                    },
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      LengthLimitingTextInputFormatter(2),
                    ],
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
