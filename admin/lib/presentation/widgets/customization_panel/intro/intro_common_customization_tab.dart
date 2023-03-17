import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:survey_admin/presentation/app/localization/localizations.dart';
import 'package:survey_admin/presentation/utils/colors.dart';
import 'package:survey_admin/presentation/widgets/customization_items/color_customization_item.dart';
import 'package:survey_admin/presentation/widgets/customization_items/customization_items_container.dart';
import 'package:survey_admin/presentation/widgets/customization_items/radius_customization_item.dart';
import 'package:survey_admin/presentation/widgets/customization_panel/customization_tab.dart';
import 'package:survey_core/survey_core.dart';

class IntroCommonCustomizationTab extends CustomizationTab {
  final IntroQuestionTheme initialTheme;
  final ValueChanged<Color> onFillColorPicked;
  final ValueChanged<Color> onTitleColorPicked;
  final ValueChanged<double> onTitleFontSizeChanged;
  final ValueChanged<Color> onSubtitleColorPicked;
  final ValueChanged<double> onSubtitleFontSizeChanged;
  final ValueChanged<Color> onButtonColorPicked;
  final ValueChanged<Color> onButtonTextColorPicked;
  final ValueChanged<double> onButtonFontSizeChanged;
  final ValueChanged<int> onButtonRadiusChanged;

  const IntroCommonCustomizationTab({
    required super.title,
    required this.initialTheme,
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
              initialColor: initialTheme.fillColor,
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
            ),
          ],
        ),
        CustomizationItemsContainer(
          title: context.localization.subtitle,
          children: [
            ColorCustomizationItem(
              initialColor: AppColors.black,
              onColorPicked: onSubtitleColorPicked,
            ),
          ],
        ),
        CustomizationItemsContainer(
          title: context.localization.button,
          children: [
            ColorCustomizationItem(
              initialColor: initialTheme.mainButtonColor,
              onColorPicked: onButtonColorPicked,
            ),
            // TextStyleCustomizationItem(
            //   initialColor: initialTheme.mainButtonTextColor,
            //   onColorPicked: onButtonTextColorPicked,
            //   initialText: initialTheme.mainButtonTextSize.toString(),
            //   inputFormatters: [
            //     FilteringTextInputFormatter.digitsOnly,
            //     LengthLimitingTextInputFormatter(2),
            //   ],
            //   onTextChanged: (value) {
            //     if (value == null) return;
            //
            //     final size = double.tryParse(value);
            //     if (size != null) {
            //       onButtonFontSizeChanged(size);
            //     }
            //   },
            // ),
            RadiusCustomizationItem(
              initialValue: initialTheme.mainButtonRadius,
              onRadiusChanged: onButtonRadiusChanged,
            ),
          ],
        ),
      ],
    );
  }
}
