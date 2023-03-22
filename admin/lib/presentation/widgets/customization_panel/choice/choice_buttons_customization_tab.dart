import 'package:flutter/material.dart';
import 'package:survey_admin/presentation/app/localization/localizations.dart';
import 'package:survey_admin/presentation/utils/utils.dart';
import 'package:survey_admin/presentation/widgets/customization_items/color_customization_item.dart';
import 'package:survey_admin/presentation/widgets/customization_items/customization_items_container.dart';
import 'package:survey_admin/presentation/widgets/customization_items/multiple_choice_customization_item.dart';
import 'package:survey_admin/presentation/widgets/customization_panel/customization_tab.dart';

class ChoiceButtonsCustomizationTab extends CustomizationTab {
  final ValueChanged<bool> onMultipleChoiceUpdate;
  final ValueChanged<Color> onActiveColorPicked;
  final ValueChanged<Color> onInactiveColorPicked;

  const ChoiceButtonsCustomizationTab({
    required super.title,
    required this.onMultipleChoiceUpdate,
    required this.onActiveColorPicked,
    required this.onInactiveColorPicked,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomizationItemsContainer(
          isTopDividerShown: true,
          itemsPadding: const EdgeInsets.all(
            AppDimensions.marginM,
          ),
          children: [
            MultipleChoiceCustomizationItem(
              onChanged: onMultipleChoiceUpdate,
            ),
          ],
        ),
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
