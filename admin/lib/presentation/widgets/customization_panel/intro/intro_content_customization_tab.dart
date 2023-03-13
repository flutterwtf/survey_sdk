import 'package:flutter/material.dart';
import 'package:survey_admin/presentation/app/localization/localizations.dart';
import 'package:survey_admin/presentation/utils/constants/app_dimensions.dart';
import 'package:survey_admin/presentation/widgets/customization_items/create_text_customization_item.dart';
import 'package:survey_admin/presentation/widgets/customization_items/customization_items_container.dart';
import 'package:survey_admin/presentation/widgets/customization_items/secondary_button_customization_item.dart';
import 'package:survey_admin/presentation/widgets/customization_panel/customization_tab.dart';

class IntroContentCustomizationTab extends CustomizationTab {
  final ValueChanged<String> onTitleChanged;
  final ValueChanged<String> onSubtitleChanged;
  final ValueChanged<String> onPrimaryButtonTextChanged;
  final void Function(bool isShown, String text) onSecondaryButtonChanged;

  const IntroContentCustomizationTab({
    required super.title,
    required this.onTitleChanged,
    required this.onSubtitleChanged,
    required this.onPrimaryButtonTextChanged,
    required this.onSecondaryButtonChanged,
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
            CreateTextCustomizationItem(
              maxHeight: AppDimensions.sizeL,
              onChanged: onTitleChanged,
            )
          ],
        ),
        CustomizationItemsContainer(
          title: context.localization.subtitle,
          children: [
            CreateTextCustomizationItem(
              maxHeight: AppDimensions.sizeL,
              onChanged: onSubtitleChanged,
            ),
          ],
        ),
        CustomizationItemsContainer(
          title: context.localization.primary_button,
          children: [
            CreateTextCustomizationItem(
              maxHeight: AppDimensions.sizeL,
              onChanged: onPrimaryButtonTextChanged,
            )
          ],
        ),
        CustomizationItemsContainer(
          itemsPadding: const EdgeInsets.all(
            AppDimensions.marginM,
          ),
          children: [
            SecondaryButtonCustomizationItem(
              onChanged: onSecondaryButtonChanged,
            ),
          ],
        ),
      ],
    );
  }
}
