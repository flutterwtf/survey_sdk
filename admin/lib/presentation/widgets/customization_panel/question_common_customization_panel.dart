import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:survey_admin/presentation/app/localization/localizations.dart';
import 'package:survey_admin/presentation/utils/colors.dart';
import 'package:survey_admin/presentation/widgets/customization_items/color_customization_item.dart';
import 'package:survey_admin/presentation/widgets/customization_items/customization_items_container.dart';
import 'package:survey_admin/presentation/widgets/customization_items/customization_widgets/customization_text_field.dart';
import 'package:survey_admin/presentation/widgets/customization_panel/customization_panel.dart';

class QuestionCommonCustomizationPanel extends CustomizationPanel {
  final ValueChanged<Color> onFillColorPicked;
  final ValueChanged<Color> onTitleColorPicked;
  final ValueChanged<int?> onTitleFontSizeChanged;
  final ValueChanged<Color> onSubtitleColorPicked;
  final ValueChanged<int?> onSubtitleFontSizeChanged;
  final ValueChanged<Color> onButtonFirstColorPicked;
  final ValueChanged<Color> onButtonSecondColorPicked;
  final ValueChanged<int?> onButtonFontSizeChanged;

  const QuestionCommonCustomizationPanel({
    super.key,
    required super.title,
    required this.onFillColorPicked,
    required this.onTitleColorPicked,
    required this.onTitleFontSizeChanged,
    required this.onSubtitleColorPicked,
    required this.onSubtitleFontSizeChanged,
    required this.onButtonFirstColorPicked,
    required this.onButtonSecondColorPicked,
    required this.onButtonFontSizeChanged,
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
              initialColor: AppColors.black,
              onColorPicked: onFillColorPicked,
            ),
          ],
        ),
        CustomizationItemsContainer(
          title: context.localization.title,
          children: [
            Row(
              children: [
                Flexible(
                  child: ColorCustomizationItem(
                    initialColor: AppColors.black,
                    onColorPicked: onTitleColorPicked,
                  ),
                ),
                Flexible(
                  child: CustomizationTextField(
                    // TODO(dev): we should fix it everywhere
                    initialValue: '16',
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      LengthLimitingTextInputFormatter(2),
                    ],
                    onChanged: (size) {
                      if (size == null) {
                        onTitleFontSizeChanged(null);
                      } else {
                        onTitleFontSizeChanged(int.tryParse(size));
                      }
                    },
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
                Flexible(
                  child: ColorCustomizationItem(
                    initialColor: AppColors.black,
                    onColorPicked: onSubtitleColorPicked,
                  ),
                ),
                Flexible(
                  child: CustomizationTextField(
                    initialValue: '12',
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      LengthLimitingTextInputFormatter(2),
                    ],
                    onChanged: (size) {
                      if (size == null) {
                        onSubtitleFontSizeChanged(null);
                      } else {
                        onSubtitleFontSizeChanged(int.tryParse(size));
                      }
                    },
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
              onColorPicked: onButtonFirstColorPicked,
            ),
            Row(
              children: [
                Flexible(
                  child: ColorCustomizationItem(
                    initialColor: AppColors.white,
                    onColorPicked: onButtonSecondColorPicked,
                  ),
                ),
                Flexible(
                  child: CustomizationTextField(
                    initialValue: '12',
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      LengthLimitingTextInputFormatter(2),
                    ],
                    onChanged: (size) {
                      if (size == null) {
                        onButtonFontSizeChanged(null);
                      } else {
                        onButtonFontSizeChanged(int.tryParse(size));
                      }
                    },
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
