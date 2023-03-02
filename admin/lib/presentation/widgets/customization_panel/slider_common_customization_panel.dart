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
import 'package:survey_admin/presentation/widgets/customization_panel/customization_panel.dart';

class SliderCommonCustomizationPanel extends CustomizationPanel {
  final ValueChanged<Color> onFillColorChanged;
  final ValueChanged<Color> onTitleColorChanged;
  final ValueChanged<Color> onSubtitleColorChanged;
  final ValueChanged<Color> onButtonUpColorChanged;
  final ValueChanged<Color> onButtonDownColorChanged;
  final ValueChanged<String?> onTitleChanged;
  final ValueChanged<String?> onSubtitleChanged;
  final ValueChanged<String?> onButtonDownChanged;
  final ValueChanged<String?> onButtonBorderChanged;

  const SliderCommonCustomizationPanel({
    super.key,
    required super.title,
    required this.onButtonDownColorChanged,
    required this.onButtonUpColorChanged,
    required this.onFillColorChanged,
    required this.onSubtitleColorChanged,
    required this.onTitleColorChanged,
    required this.onTitleChanged,
    required this.onSubtitleChanged,
    required this.onButtonDownChanged,
    required this.onButtonBorderChanged,
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
            Row(
              children: [
                Expanded(
                  child: ColorCustomizationItem(
                    initialColor: AppColors.black,
                    onColorPicked: onTitleColorChanged,
                  ),
                ),
                Expanded(
                  child: CustomizationTextField(
                    initialValue: AppFonts.sizeL.toString(),
                    onChanged: onTitleChanged,
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
        CustomizationItemsContainer(
          title: context.localization.subtitle,
          children: [
            Row(
              children: [
                Expanded(
                  child: ColorCustomizationItem(
                    initialColor: AppColors.black,
                    onColorPicked: onSubtitleColorChanged,
                  ),
                ),
                Expanded(
                  child: CustomizationTextField(
                    initialValue: AppFonts.sizeL.toString(),
                    onChanged: onSubtitleChanged,
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
        CustomizationItemsContainer(
          title: context.localization.button,
          children: [
            ColorCustomizationItem(
              initialColor: AppColors.black,
              onColorPicked: onButtonUpColorChanged,
            ),
            Row(
              children: [
                Expanded(
                  child: ColorCustomizationItem(
                    initialColor: AppColors.white,
                    onColorPicked: onButtonDownColorChanged,
                  ),
                ),
                Expanded(
                  child: CustomizationTextField(
                    initialValue: AppFonts.sizeL.toString(),
                    onChanged: onButtonDownChanged,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      LengthLimitingTextInputFormatter(2),
                    ],
                  ),
                ),
              ],
            ),
            Row(
              children: [
                SvgPicture.asset(AppAssets.arcIcon),
                const SizedBox(width: AppDimensions.margin2XS),
                Expanded(
                  child: CustomizationTextField(
                    initialValue: AppFonts.sizeL.toString(),
                    onChanged: onButtonBorderChanged,
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
