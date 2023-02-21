import 'package:flutter/material.dart';
import 'package:survey_admin/presentation/utils/colors.dart';
import 'package:survey_admin/presentation/widgets/customization_items/color_customization_item.dart';
import 'package:survey_admin/presentation/widgets/customization_items/customization_items_container.dart';

class ChoiceCustomizationPanel extends StatelessWidget {
  final ValueChanged<Color> onActiveColorPicked;
  final ValueChanged<Color> onInactiveColorPicked;

  const ChoiceCustomizationPanel({
    Key? key,
    required this.onActiveColorPicked,
    required this.onInactiveColorPicked,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomizationItemsContainer(
          title: 'Active',
          children: [
            ColorCustomizationItem(
              initialColor: AppColors.black,
              onColorPicked: onActiveColorPicked,
            ),
          ],
        ),
        CustomizationItemsContainer(
          title: 'Inactive',
          children: [
            ColorCustomizationItem(
              initialColor: AppColors.inactiveElementGrey,
              onColorPicked: onInactiveColorPicked,
            ),
          ],
        ),
      ],
    );
  }
}
