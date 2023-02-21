import 'package:flutter/material.dart';
import 'package:survey_admin/presentation/utils/constants/constants.dart';
import 'package:survey_admin/presentation/widgets/customization_items/create_text_customization_item.dart';
import 'package:survey_admin/presentation/widgets/customization_items/customization_items_container.dart';
import 'package:survey_admin/presentation/widgets/customization_items/divisions_customization_item.dart';
import 'package:survey_admin/presentation/widgets/customization_items/min_max_customization_item.dart';
import 'package:survey_admin/presentation/widgets/customization_panel/customization_panel.dart';

class ContentCustomizationPanel extends CustomizationPanel {
  final ValueChanged<String> onTitleChanged;
  final ValueChanged<String> onSubtitleChanged;
  final void Function(int? min, int? max) onMinMaxChanged;
  final ValueChanged<int?> onDivisionsChanged;

  const ContentCustomizationPanel({
    super.key,
    required super.title,
    required this.onDivisionsChanged,
    required this.onMinMaxChanged,
    required this.onSubtitleChanged,
    required this.onTitleChanged,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        CustomizationItemsContainer(
          title: 'Title',
          children: [
            CreateTextCustomizationItem(
              maxHeight: AppDimensions.sizeL,
              onChanged: onTitleChanged,
            )
          ],
        ),
        CustomizationItemsContainer(
          title: 'SubTitle',
          children: [
            CreateTextCustomizationItem(
              maxHeight: AppDimensions.sizeL,
              onChanged: onSubtitleChanged,
            ),
          ],
        ),
        CustomizationItemsContainer(
          title: 'Value',
          children: [
            MinMaxCustomizationItem(
              onChanged: onMinMaxChanged,
            ),
          ],
        ),
        CustomizationItemsContainer(
          title: 'Divisions',
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
