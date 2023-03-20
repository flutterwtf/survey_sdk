import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:survey_admin/presentation/app/localization/localizations.dart';
import 'package:survey_admin/presentation/pages/builder/builder_cubit.dart';
import 'package:survey_admin/presentation/pages/builder/builder_state.dart';
import 'package:survey_admin/presentation/utils/constants/app_dimensions.dart';
import 'package:survey_admin/presentation/widgets/customization_items/customization_items_container.dart';
import 'package:survey_admin/presentation/widgets/customization_items/customization_multiline_text_field.dart';
import 'package:survey_admin/presentation/widgets/customization_items/divisions_customization_item.dart';
import 'package:survey_admin/presentation/widgets/customization_items/min_max_customization_item.dart';
import 'package:survey_admin/presentation/widgets/customization_panel/customization_tab.dart';
import 'package:survey_core/survey_core.dart';

class SliderContentCustomizationTab extends CustomizationTab {
  const SliderContentCustomizationTab({
    required super.title,
    super.key,
  });

  @override
  State<CustomizationTab> createState() => SliderContentCustomizationTabState();
}

class SliderContentCustomizationTabState
    extends CustomizationTabState<SliderContentCustomizationTab> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BuilderCubit, BuilderState>(
      builder: (context, state) {
        final data = (state as EditQuestionBuilderState).selectedQuestion!
            as SliderQuestionData;
        return ListView(
          children: [
            CustomizationItemsContainer(
              title: context.localization.title,
              isTopDividerShown: true,
              children: [
                CustomizationMultilineTextField(
                  maxHeight: AppDimensions.sizeXL,
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
                  maxHeight: AppDimensions.sizeXL,
                  onChanged: (subtitle) => cubit.updateQuestionData(
                    data.copyWith(title: subtitle),
                  ),
                ),
              ],
            ),
            CustomizationItemsContainer(
              title: context.localization.value,
              children: [
                MinMaxCustomizationItem(
                  onChanged: (min, max) => cubit.updateQuestionData(
                    data.copyWith(minValue: min, maxValue: max),
                  ),
                ),
              ],
            ),
            CustomizationItemsContainer(
              title: context.localization.divisions,
              children: [
                DivisionsCustomizationItem(
                  onChanged: (divisions) => cubit.updateQuestionData(
                    data.copyWith(divisions: divisions),
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
