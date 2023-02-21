import 'package:flutter/material.dart';
import 'package:survey_admin/presentation/utils/constants/constants.dart';
import 'package:survey_admin/presentation/widgets/customization_items/create_text_customization_item.dart';
import 'package:survey_admin/presentation/widgets/customization_items/customization_items_container.dart';
import 'package:survey_admin/presentation/widgets/customization_items/switch_customization_item.dart';

class IntroContentCustomizationPanel extends StatelessWidget {
  final ValueChanged<String> onTitleChanged;
  final ValueChanged<String> onSubTitleChanged;
  final ValueChanged<String> onButtonChanged;
  final ValueChanged<bool> onSwitchChanged;

  const IntroContentCustomizationPanel({
    Key? key,
    required this.onTitleChanged,
    required this.onSubTitleChanged,
    required this.onButtonChanged,
    required this.onSwitchChanged,
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
          title: 'Primary button',
          children: [
            CreateTextCustomizationItem(
              maxHeight: AppDimensions.sizeL,
              onChanged: onButtonChanged,
            )
          ],
        ),
        CustomizationItemsContainer(
          children: [
            SwitchCustomizationItem(
              onChanged: onSwitchChanged,
              title: 'Secondary button',
            )
          ],
        ),
      ],
    );
  }
}
