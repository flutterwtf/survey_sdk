import 'package:flutter/material.dart';
import 'package:survey_admin/presentation/app/localization/localizations.dart';
import 'package:survey_admin/presentation/utils/colors.dart';
import 'package:survey_admin/presentation/widgets/customization_items/color_customization_item.dart';
import 'package:survey_admin/presentation/widgets/customization_items/customization_items_container.dart';
import 'package:survey_admin/presentation/widgets/customization_panel/customization_tab.dart';

class ChoiceButtonsCustomizationTab extends CustomizationTab {
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
        CustomizationItemsContainer(
          title: context.localization.active,
          isTopDividerShown: true,
          children: [
            ColorCustomizationItem(
              initialColor: AppColors.black,
              onColorPicked: onActiveColorPicked,
            ),
          ],
        ),
        CustomizationItemsContainer(
          title: context.localization.inactive,
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
