import 'package:flutter/material.dart';
import 'package:survey_admin/presentation/app/localization/localizations.dart';
import 'package:survey_admin/presentation/utils/constants/constants.dart';
import 'package:survey_admin/presentation/widgets/customization_items/create_text_customization_item.dart';
import 'package:survey_admin/presentation/widgets/customization_items/customization_items_container.dart';
import 'package:survey_admin/presentation/widgets/customization_items/option_customization_item.dart';
import 'package:survey_admin/presentation/widgets/customization_panel/customization_panel.dart';

class ChoiceContentCustomizationTab extends CustomizationPanel {
  final ValueChanged<String> onTitleChanged;
  final ValueChanged<String> onSubTitleChanged;
  final ValueChanged<List<String>> onOptionsChanged;

  const ChoiceContentCustomizationTab({
    super.key,
    required super.title,
    required this.onTitleChanged,
    required this.onSubTitleChanged,
    required this.onOptionsChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomizationItemsContainer(
          title: context.localization.title,
          isTopDividerShown: true,
          children: [
            CreateTextCustomizationItem(
              maxHeight: AppDimensions.sizeXL,
              onChanged: onTitleChanged,
            )
          ],
        ),
        CustomizationItemsContainer(
          title: context.localization.subtitle,
          children: [
            CreateTextCustomizationItem(
              maxHeight: AppDimensions.sizeXL,
              onChanged: onSubTitleChanged,
            ),
          ],
        ),
        CustomizationItemsContainer(
          title: context.localization.options,
          children: [
            OptionCustomizationItem(
              options: const [],
              onChanged: onOptionsChanged,
            )
          ],
        ),
      ],
    );
  }
}
