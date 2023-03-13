import 'package:flutter/cupertino.dart';
import 'package:survey_admin/presentation/app/localization/localizations.dart';
import 'package:survey_admin/presentation/utils/colors.dart';
import 'package:survey_admin/presentation/widgets/customization_items/color_customization_item.dart';
import 'package:survey_admin/presentation/widgets/customization_items/customization_items_container.dart';
import 'package:survey_admin/presentation/widgets/customization_items/text_style_customization_item.dart';
import 'package:survey_admin/presentation/widgets/customization_panel/customization_tab.dart';

class InputCommonCustomizationTab extends CustomizationTab {
  final ValueChanged<Color> onFillColorPicked;
  final ValueChanged<Color> onTitleColorPicked;
  final ValueChanged<int> onTitleFontSizeChanged;
  final ValueChanged<Color> onSubtitleColorPicked;
  final ValueChanged<int> onSubtitleFontSizeChanged;
  final ValueChanged<Color> onButtonFirstColorPicked;
  final ValueChanged<Color> onButtonSecondColorPicked;
  final ValueChanged<int> onButtonFontSizeChanged;

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
            TextStyleCustomizationItem(
              initialColor: AppColors.black,
              onColorPicked: onTitleColorPicked,
              initialFontSize: '16',
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
              initialFontSize: '12',
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
              onColorPicked: onButtonFirstColorPicked,
            ),
            TextStyleCustomizationItem(
              initialColor: AppColors.white,
              onColorPicked: onButtonSecondColorPicked,
              initialFontSize: '12',
              onFontSizeChanged: (value) {
                final size = int.tryParse(value);
                if (size != null) {
                  onButtonFontSizeChanged(size);
                }
              },
            ),
          ],
        ),
      ],
    );
  }
}
