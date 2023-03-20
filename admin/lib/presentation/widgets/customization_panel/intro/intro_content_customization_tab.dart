import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:survey_admin/presentation/app/localization/localizations.dart';
import 'package:survey_admin/presentation/pages/builder/builder_cubit.dart';
import 'package:survey_admin/presentation/pages/builder/builder_state.dart';
import 'package:survey_admin/presentation/utils/constants/app_dimensions.dart';
import 'package:survey_admin/presentation/widgets/customization_items/customization_items_container.dart';
import 'package:survey_admin/presentation/widgets/customization_items/customization_multiline_text_field.dart';
import 'package:survey_admin/presentation/widgets/customization_items/secondary_button_customization_item.dart';
import 'package:survey_admin/presentation/widgets/customization_panel/customization_tab.dart';
import 'package:survey_core/survey_core.dart';

class IntroContentCustomizationTab extends CustomizationTab {
  const IntroContentCustomizationTab({
    required super.title,
    super.key,
  });

  @override
  State<CustomizationTab> createState() => IntroContentCustomizationTabState();
}

class IntroContentCustomizationTabState
    extends CustomizationTabState<IntroContentCustomizationTab> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BuilderCubit, BuilderState>(
      builder: (context, state) {
        final data = (state as EditQuestionBuilderState).selectedQuestion!
            as IntroQuestionData;
        return ListView(
          children: [
            CustomizationItemsContainer(
              title: context.localization.title,
              isTopDividerShown: true,
              children: [
                CustomizationMultilineTextField(
                  maxHeight: AppDimensions.sizeL,
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
                  maxHeight: AppDimensions.sizeL,
                  onChanged: (subtitle) => cubit.updateQuestionData(
                    data.copyWith(title: subtitle),
                  ),
                ),
              ],
            ),
            CustomizationItemsContainer(
              title: context.localization.primary_button,
              children: [
                CustomizationMultilineTextField(
                  maxHeight: AppDimensions.sizeL,
                  onChanged: (text) => cubit.updateQuestionData(
                    data.copyWith(buttonText: text),
                  ),
                ),
              ],
            ),
            CustomizationItemsContainer(
              itemsPadding: const EdgeInsets.all(
                AppDimensions.marginM,
              ),
              children: [
                SecondaryButtonCustomizationItem(
                  // TODO(dev): Do we plan to change title?
                  onChanged: (canSkip, title) => cubit.updateQuestionData(
                    data.copyWith(isSkip: canSkip),
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
