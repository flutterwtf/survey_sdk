import 'package:flutter/material.dart';
import 'package:survey_admin/presentation/utils/colors.dart';
import 'package:survey_admin/presentation/widgets/customization_items/color_customization_item.dart';
import 'package:survey_admin/presentation/widgets/customization_items/customization_items_container.dart';

// TODO: add text style customization items
// TODO: add radius customization item

class IntroCommonCustomizationPanel extends StatelessWidget {
  final ValueChanged<Color> onFillColorPicked;
  final ValueChanged<Color> onButtonColorPicked;

  const IntroCommonCustomizationPanel({
    Key? key,
    required this.onFillColorPicked,
    required this.onButtonColorPicked,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomizationItemsContainer(
          title: 'Fill',
          children: [
            ColorCustomizationItem(
              initialColor: AppColors.white,
              onColorPicked: onFillColorPicked,
            ),
          ],
        ),
        CustomizationItemsContainer(
          title: 'Button',
          children: [
            ColorCustomizationItem(
              initialColor: AppColors.black,
              onColorPicked: onButtonColorPicked,
            ),
          ],
        ),
      ],
    );
  }
}
