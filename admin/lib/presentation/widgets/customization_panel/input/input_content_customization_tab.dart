import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:survey_admin/presentation/app/localization/localizations.dart';
import 'package:survey_admin/presentation/pages/builder/builder_cubit.dart';
import 'package:survey_admin/presentation/pages/builder/builder_state.dart';
import 'package:survey_admin/presentation/widgets/customization_items/customization_items_container.dart';
import 'package:survey_admin/presentation/widgets/customization_items/customization_multiline_text_field.dart';
import 'package:survey_admin/presentation/widgets/customization_panel/customization_tab.dart';
import 'package:survey_core/survey_core.dart';

class InputContentCustomizationTab extends CustomizationTab {
  const InputContentCustomizationTab({
    required super.title,
    super.key,
  });

  @override
  State<CustomizationTab> createState() => InputContentCustomizationTabState();
}

class InputContentCustomizationTabState
    extends CustomizationTabState<InputContentCustomizationTab> {
  static const double _maxInputTextHeight = 100;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BuilderCubit, BuilderState>(
      builder: (context, state) {
        final data = (state as EditQuestionBuilderState).selectedQuestion!
            as InputQuestionData;
        return ListView(
          children: [
            CustomizationItemsContainer(
              title: context.localization.title,
              isTopDividerShown: true,
              children: [
                CustomizationMultilineTextField(
                  maxHeight: _maxInputTextHeight,
                  onChanged: (title) => cubit.updateQuestionData(
                    data.copyWith(title: title),
                  ),
                ),
              ],
            ),
            CustomizationItemsContainer(
              title: context.localization.subtitle,
              children: [
                CustomizationMultilineTextField(
                  maxHeight: _maxInputTextHeight,
                  onChanged: (subtitle) => cubit.updateQuestionData(
                    data.copyWith(subtitle: subtitle),
                  ),
                ),
              ],
            ),
            CustomizationItemsContainer(
              title: context.localization.hint,
              children: [
                CustomizationMultilineTextField(
                  maxHeight: _maxInputTextHeight,
                  onChanged: (hint) => cubit.updateQuestionData(
                    data.copyWith(hintText: hint),
                  ),
                ),
              ],
            ),
            // TODO(dev): Kind of strange to put this here.
            CustomizationItemsContainer(
              title: context.localization.button,
              children: [
                CustomizationMultilineTextField(
                  maxHeight: _maxInputTextHeight,
                  onChanged: (text) => cubit.updateQuestionData(
                    data.copyWith(buttonText: text),
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
