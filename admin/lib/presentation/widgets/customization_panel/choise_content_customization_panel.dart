import 'package:flutter/material.dart';
import 'package:survey_admin/presentation/utils/constants/constants.dart';
import 'package:survey_admin/presentation/widgets/customization_items/create_text_customization_item.dart';
import 'package:survey_admin/presentation/widgets/customization_items/customization_items_container.dart';
import 'package:survey_admin/presentation/widgets/customization_items/option_customization_item.dart';

class ChoiceContentCustomizationPanel extends StatelessWidget {
  final ValueChanged<String> onTitleChanged;
  final ValueChanged<String> onSubTitleChanged;
  final ValueChanged<List<String>> onOptionsChanged;

  const ChoiceContentCustomizationPanel({
    Key? key,
    required this.onTitleChanged,
    required this.onSubTitleChanged,
    required this.onOptionsChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
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
              onChanged: onSubTitleChanged,
            ),
          ],
        ),
        CustomizationItemsContainer(
          title: 'Options',
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
