import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:survey_admin/presentation/app/localization/app_localizations_ext.dart';
import 'package:survey_admin/presentation/pages/builder/builder_cubit.dart';
import 'package:survey_admin/presentation/pages/builder/builder_state.dart';
import 'package:survey_admin/presentation/utils/constants/app_dimensions.dart';
import 'package:survey_admin/presentation/utils/utils.dart';
import 'package:survey_admin/presentation/widgets/customization_items/customization_items_container.dart';
import 'package:survey_admin/presentation/widgets/customization_items/customization_multiline_text_field.dart';
import 'package:survey_admin/presentation/widgets/customization_items/secondary_button_customization_item.dart';
import 'package:survey_admin/presentation/widgets/customization_panel/customization_tab.dart';
import 'package:survey_core/survey_core.dart';

class IntroContentCustomizationTab extends CustomizationTab {
  final void Function(QuestionData data) onChange;
  final IntroQuestionData editable;

  const IntroContentCustomizationTab({
    required this.onChange,
    required super.title,
    required this.editable,
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
        final data = widget.editable;
        return ListView(
          children: [
            CustomizationItemsContainer(
              title: context.localization.title,
              isTopDividerShown: true,
              children: [
                CustomizationMultilineTextField(
                  maxHeight: AppDimensions.sizeL,
                  onChanged: (title) => widget.onChange(
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
                  onChanged: (subtitle) => widget.onChange(
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
                  onChanged: (text) => widget.onChange(
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
                  onChanged: (canSkip, title) => widget.onChange(
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
