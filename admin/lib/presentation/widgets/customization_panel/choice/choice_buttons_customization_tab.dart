import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:survey_admin/presentation/app/localization/localizations.dart';
import 'package:survey_admin/presentation/pages/builder/builder_cubit.dart';
import 'package:survey_admin/presentation/pages/builder/builder_state.dart';
import 'package:survey_admin/presentation/utils/colors.dart';
import 'package:survey_admin/presentation/utils/constants/app_dimensions.dart';
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
  @override
  Widget build(BuildContext context) {
    // TODO(dev): Maybe retrieve state here instead of builder again?
    return BlocBuilder<BuilderCubit, BuilderState>(
      builder: (context, state) {
        final data = widget.editable;
        final theme = data.theme ?? const ChoiceQuestionTheme.common();
        return Column(
          children: [
            CustomizationItemsContainer(
              isTopDividerShown: true,
              itemsPadding: const EdgeInsets.all(
                AppDimensions.marginM,
              ),
              children: [
                // TODO(dev): Move to the other tab.
                MultipleChoiceCustomizationItem(
                  onChanged: (isMultipleChoice) => widget.onChange(
                    data.copyWith(isMultipleChoice: isMultipleChoice),
                  ),
                ),
              ],
            ),
            CustomizationItemsContainer(
              title: context.localization.active,
              isTopDividerShown: true,
              children: [
                ColorCustomizationItem(
                  initialColor: AppColors.black,
                  onColorPicked: (color) => widget.onChange(
                    data.copyWith(
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
                  initialColor: AppColors.inactiveElementGrey,
                  onColorPicked: (color) => widget.onChange(
                    data.copyWith(
                      theme: theme.copyWith(inactiveColor: color),
                    ),
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
