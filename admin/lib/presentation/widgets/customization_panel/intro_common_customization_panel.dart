import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:survey_admin/presentation/app/localization/localizations.dart';
import 'package:survey_admin/presentation/utils/colors.dart';
import 'package:survey_admin/presentation/widgets/customization_items/color_customization_item.dart';
import 'package:survey_admin/presentation/widgets/customization_items/color_with_text_field_customization_item.dart';
import 'package:survey_admin/presentation/widgets/customization_items/customization_items_container.dart';
import 'package:survey_admin/presentation/widgets/customization_items/radius_customization_item.dart';
import 'package:survey_admin/presentation/widgets/customization_panel/customization_panel.dart';

class IntroCommonCustomizationPanel extends CustomizationPanel {
  final ValueChanged<Color> onFillColorPicked;
  final ValueChanged<Color> onTitleColorPicked;
  final ValueChanged<int?> onTitleFontSizeChanged;
  final ValueChanged<Color> onSubtitleColorPicked;
  final ValueChanged<int?> onSubtitleFontSizeChanged;
  final ValueChanged<Color> onButtonColorPicked;
  final ValueChanged<Color> onButtonTextColorPicked;
  final ValueChanged<int?> onButtonFontSizeChanged;
  final ValueChanged<int?> onButtonRadiusChanged;

  const IntroCommonCustomizationPanel({
    super.key,
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
            ColorWithTextFieldCustomizationItem(
              onColorPicked: onTitleColorPicked,
              // TODO(dev): what are the magic Strings here and in items below?
              initialText: '16',
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                LengthLimitingTextInputFormatter(3),
              ],
              onTextChanged: (size) {
                if (size == null) {
                  onTitleFontSizeChanged(null);
                } else {
                  onTitleFontSizeChanged(int.tryParse(size));
                }
              },
            ),
          ],
        ),
        CustomizationItemsContainer(
          title: context.localization.subtitle,
          children: [
            ColorWithTextFieldCustomizationItem(
              onColorPicked: onSubtitleColorPicked,
              initialText: '12',
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                LengthLimitingTextInputFormatter(3),
              ],
              onTextChanged: (size) {
                if (size == null) {
                  onSubtitleFontSizeChanged(null);
                } else {
                  onSubtitleFontSizeChanged(int.tryParse(size));
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
            ColorWithTextFieldCustomizationItem(
              initialColor: AppColors.white,
              onColorPicked: onButtonTextColorPicked,
              initialText: '12',
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                LengthLimitingTextInputFormatter(3),
              ],
              onTextChanged: (size) {
                if (size == null) {
                  onButtonFontSizeChanged(null);
                } else {
                  onButtonFontSizeChanged(int.tryParse(size));
                }
              },
            ),
            RadiusCustomizationItem(
              initialValue: 10,
              onRadiusChanged: onButtonRadiusChanged,
            ),
          ],
        ),
      ],
    );
  }
}
