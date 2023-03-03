import 'package:flutter/material.dart';
import 'package:survey_admin/presentation/utils/colors.dart';
import 'package:survey_admin/presentation/widgets/customization_items/color_customization_item.dart';
import 'package:survey_admin/presentation/widgets/customization_items/customization_items_container.dart';
import 'package:survey_admin/presentation/widgets/customization_panel/customization_panel.dart';

class ChoiceButtonsCustomizationTab extends CustomizationPanel {
  final ValueChanged<Color> onActiveColorPicked;
  final ValueChanged<Color> onInactiveColorPicked;

  const ChoiceButtonsCustomizationTab({
    super.key,
    required super.title,
    required this.onActiveColorPicked,
    required this.onInactiveColorPicked,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // TODO: localizations
        CustomizationItemsContainer(
          title: 'Active',
          children: [
            ColorCustomizationItem(
              initialColor: AppColors.black,
              onColorPicked: onActiveColorPicked,
            ),
          ],
        ),
        // TODO: localizations
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
