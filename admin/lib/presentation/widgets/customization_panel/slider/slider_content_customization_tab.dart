import 'package:flutter/material.dart';
import 'package:survey_admin/presentation/app/localization/localizations.dart';
import 'package:survey_admin/presentation/utils/constants/app_dimensions.dart';
import 'package:survey_admin/presentation/widgets/customization_items/customization_items_container.dart';
import 'package:survey_admin/presentation/widgets/customization_items/customization_multiline_text_field.dart';
import 'package:survey_admin/presentation/widgets/customization_items/divisions_customization_item.dart';
import 'package:survey_admin/presentation/widgets/customization_items/min_max_customization_item.dart';
import 'package:survey_admin/presentation/widgets/customization_panel/customization_tab.dart';

class SliderContentCustomizationTab extends CustomizationTab {
  final ValueChanged<String> onTitleChanged;
  final ValueChanged<String> onSubtitleChanged;
  final void Function(int min, int max) onMinMaxChanged;
  final ValueChanged<int> onDivisionsChanged;

  const SliderContentCustomizationTab({
    required super.title,
    required this.onDivisionsChanged,
    required this.onMinMaxChanged,
    required this.onSubtitleChanged,
    required this.onTitleChanged,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        CustomizationItemsContainer(
          title: context.localization.title,
          isTopDividerShown: true,
          children: [
            CustomizationMultilineTextField(
              maxHeight: AppDimensions.sizeXL,
              onChanged: onTitleChanged,
            )
          ],
        ),
        CustomizationItemsContainer(
          title: context.localization.subtitle,
          children: [
            CustomizationMultilineTextField(
              maxHeight: AppDimensions.sizeXL,
              onChanged: onSubtitleChanged,
            ),
          ],
        ),
        CustomizationItemsContainer(
          title: context.localization.value,
          children: [
            MinMaxCustomizationItem(
              onChanged: onMinMaxChanged,
            ),
          ],
        ),
        CustomizationItemsContainer(
          title: context.localization.divisions,
          children: [
            DivisionsCustomizationItem(
              onChanged: onDivisionsChanged,
            ),
          ],
        ),
      ],
    );
  }
}
