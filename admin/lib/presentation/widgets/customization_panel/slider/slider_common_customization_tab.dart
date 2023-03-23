import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:survey_admin/presentation/app/localization/localizations.dart';
import 'package:survey_admin/presentation/utils/utils.dart';
import 'package:survey_admin/presentation/widgets/customization_items/color_customization_item.dart';
import 'package:survey_admin/presentation/widgets/customization_items/customization_items_container.dart';
import 'package:survey_admin/presentation/widgets/customization_items/customization_widgets/customization_text_field.dart';
import 'package:survey_admin/presentation/widgets/customization_panel/customization_tab.dart';

class SliderCommonCustomizationTab extends CustomizationTab {
  final ValueChanged<Color> onFillColorChanged;
  final ValueChanged<Color> onTitleColorChanged;
  final ValueChanged<Color> onSubtitleColorChanged;
  final ValueChanged<Color> onButtonUpColorChanged;
  final ValueChanged<Color> onButtonDownColorChanged;
  final ValueChanged<double> onTitleFontSizeChanged;
  final ValueChanged<double> onSubtitleFontSizeChanged;
  final ValueChanged<double> onButtonFontSizeChanged;
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
    const lengthInputFormatter = 2;
    final fontSize = AppFonts.sizeL.toString();
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
            ColorCustomizationItem(
              initialColor: AppColors.black,
              onColorPicked: onTitleColorChanged,
              initialSize: fontSize,
              onSizeChanged: onTitleFontSizeChanged,
            ),
          ],
        ),
        CustomizationItemsContainer(
          title: context.localization.subtitle,
          children: [
            ColorCustomizationItem(
              initialColor: AppColors.black,
              onColorPicked: onSubtitleColorChanged,
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
              onColorPicked: onButtonUpColorChanged,
            ),
            ColorCustomizationItem(
              initialColor: AppColors.white,
              onColorPicked: onButtonDownColorChanged,
              initialSize: fontSize,
              onSizeChanged: onButtonFontSizeChanged,
            ),
            Row(
              children: [
                SvgPicture.asset(AppAssets.arcIcon),
                const SizedBox(width: AppDimensions.margin2XS),
                Expanded(
                  child: CustomizationTextField(
                    initialValue: fontSize,
                    onChanged: (value) => SizeHandler.onSizeChanged(
                      value,
                      onButtonRadiusChanged,
                    ),
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      LengthLimitingTextInputFormatter(lengthInputFormatter),
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
