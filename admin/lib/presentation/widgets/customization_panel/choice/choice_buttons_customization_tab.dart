import 'package:flutter/material.dart';
import 'package:survey_admin/presentation/app/localization/app_localizations_ext.dart';
import 'package:survey_admin/presentation/utils/utils.dart';
import 'package:survey_admin/presentation/widgets/customization_items/color_customization_item.dart';
import 'package:survey_admin/presentation/widgets/customization_items/customization_items_container.dart';
import 'package:survey_admin/presentation/widgets/customization_items/multiple_choice_customization_item.dart';
import 'package:survey_admin/presentation/widgets/customization_panel/customization_tab.dart';
import 'package:survey_core/survey_core.dart';

class ChoiceButtonsCustomizationTab extends CustomizationTab {
  final void Function(QuestionData data) onChange;
  final ChoiceQuestionData editable;

  const ChoiceButtonsCustomizationTab({
    required this.onChange,
    required super.title,
    required this.editable,
    super.key,
  });

  @override
  State<CustomizationTab> createState() => ChoiceButtonsCustomizationTabState();
}

class ChoiceButtonsCustomizationTabState
    extends CustomizationTabState<ChoiceButtonsCustomizationTab> {
  ChoiceQuestionTheme get theme =>
      widget.editable.theme ?? const ChoiceQuestionTheme.common();

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        CustomizationItemsContainer(
          shouldShowTopDivider: true,
          itemsPadding: const EdgeInsets.all(
            AppDimensions.marginM,
          ),
          children: [
            // TODO(dev): Move to the other tab.
            MultipleChoiceCustomizationItem(
              value: widget.editable.isMultipleChoice,
              onChanged: (isMultipleChoice) => widget.onChange(
                widget.editable.copyWith(isMultipleChoice: isMultipleChoice),
              ),
            ),
          ],
        ),
        CustomizationItemsContainer(
          title: context.localization.active,
          shouldShowTopDivider: true,
          children: [
            ColorCustomizationItem(
              initialColor: theme.activeColor,
              onColorPicked: (color) => widget.onChange(
                widget.editable.copyWith(
                  theme: theme.copyWith(activeColor: color),
                ),
              ),
            ),
          ],
        ),
        CustomizationItemsContainer(
          title: context.localization.inactive,
          children: [
            ColorCustomizationItem(
              initialColor: theme.inactiveColor,
              onColorPicked: (color) => widget.onChange(
                widget.editable.copyWith(
                  theme: theme.copyWith(inactiveColor: color),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
