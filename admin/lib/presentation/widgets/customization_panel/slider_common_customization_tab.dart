import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:survey_admin/presentation/app/localization/localizations.dart';
import 'package:survey_admin/presentation/utils/app_fonts.dart';
import 'package:survey_admin/presentation/utils/asset_strings.dart';
import 'package:survey_admin/presentation/utils/colors.dart';
import 'package:survey_admin/presentation/utils/constants/constants.dart';
import 'package:survey_admin/presentation/widgets/customization_items/color_customization_item.dart';
import 'package:survey_admin/presentation/widgets/customization_items/customization_items_container.dart';
import 'package:survey_admin/presentation/widgets/customization_items/customization_widgets/customization_text_field.dart';
import 'package:survey_admin/presentation/widgets/customization_panel/customization_panel.dart';

class SliderCommonCustomizationTab extends CustomizationPanel {
  final ValueChanged<Color> onFillColorChanged;
  final ValueChanged<Color> onTitleColorChanged;
  final ValueChanged<Color> onSubtitleColorChanged;
  final ValueChanged<Color> onButtonUpColorChanged;
  final ValueChanged<Color> onButtonDownColorChanged;

  const SliderCommonCustomizationTab({
    super.key,
    required super.title,
    required this.onButtonDownColorChanged,
    required this.onButtonUpColorChanged,
    required this.onFillColorChanged,
    required this.onSubtitleColorChanged,
    required this.onTitleColorChanged,
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
                  ),
                ),
              ],
            ),
            Row(
              children: [
                SvgPicture.asset(AssetStrings.arc),
                const SizedBox(width: AppDimensions.margin2XS),
                Expanded(
                  child: CustomizationTextField(
                    initialValue: AppFonts.sizeL.toString(),
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
