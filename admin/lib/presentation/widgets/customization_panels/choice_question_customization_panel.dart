import 'package:flutter/material.dart';
import 'package:survey_admin/presentation/utils/colors.dart';
import 'package:survey_admin/presentation/utils/constants/constants.dart';
import 'package:survey_admin/presentation/widgets/customization_items/color_customization_item.dart';
import 'package:survey_admin/presentation/widgets/customization_items/create_text_customization_item.dart';
import 'package:survey_admin/presentation/widgets/customization_items/customization_items_container.dart';
import 'package:survey_admin/presentation/widgets/customization_items/option_customization_item.dart';
import 'package:survey_admin/presentation/widgets/customization_panels/customization_panel_constructor.dart';

class ChoiceQuestionCustomizationPanel extends StatelessWidget {
  final ValueChanged<Color> onActiveColorPicked;
  final ValueChanged<Color> onInactiveColorPicked;
  final ValueChanged<String> onTitleChanged;
  final ValueChanged<String> onSubTitleChanged;
  final ValueChanged<List<String>> onOptionsChanged;

  const ChoiceQuestionCustomizationPanel({
    Key? key,
    required this.onActiveColorPicked,
    required this.onInactiveColorPicked,
    required this.onTitleChanged,
    required this.onSubTitleChanged,
    required this.onOptionsChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomizationPanelConstructor(
      panels: [
        Panel(
          label: 'Choice',
          content: [
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
        ),
        Panel(
          label: 'Content',
          content: [
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
        ),
      ],
    );
  }
}
