import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:survey_admin/presentation/app/localization/app_localizations_ext.dart';
import 'package:survey_admin/presentation/pages/builder/builder_cubit.dart';
import 'package:survey_admin/presentation/pages/builder/builder_state.dart';
import 'package:survey_admin/presentation/utils/constants/app_dimensions.dart';
import 'package:survey_admin/presentation/utils/utils.dart';
import 'package:survey_admin/presentation/widgets/customization_items/customization_items_container.dart';
import 'package:survey_admin/presentation/widgets/customization_items/customization_multiline_text_field.dart';
import 'package:survey_admin/presentation/widgets/customization_panel/customization_tab.dart';
import 'package:survey_core/survey_core.dart';

class InputContentCustomizationTab extends CustomizationTab {
  final void Function(QuestionData data) onChange;
  final InputQuestionData editable;

  const InputContentCustomizationTab({
    required this.onChange,
    required super.title,
    required this.editable,
    super.key,
  });

  @override
  State<CustomizationTab> createState() => InputContentCustomizationTabState();
}

class InputContentCustomizationTabState
    extends CustomizationTabState<InputContentCustomizationTab> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        CustomizationItemsContainer(
          title: context.localization.title,
          isTopDividerShown: true,
          children: [
            CustomizationMultilineTextField(
              value: widget.editable.title,
              maxHeight: AppDimensions.maxTextFieldHeight,
              onChanged: (title) => widget.onChange(
                widget.editable.copyWith(title: title),
              ),
            ),
          ],
        ),
        CustomizationItemsContainer(
          title: context.localization.subtitle,
          children: [
            CustomizationMultilineTextField(
              value: widget.editable.subtitle,
              maxHeight: AppDimensions.maxTextFieldHeight,
              onChanged: (subtitle) => widget.onChange(
                widget.editable.copyWith(subtitle: subtitle),
              ),
            ),
          ],
        ),
        CustomizationItemsContainer(
          title: context.localization.hint,
          children: [
            CustomizationMultilineTextField(
              value: widget.editable.hintText ?? '',
              maxHeight: AppDimensions.maxTextFieldHeight,
              onChanged: (hint) => widget.onChange(
                widget.editable.copyWith(hintText: hint),
              ),
            ),
          ],
        ),
        // TODO(dev): Kind of strange to put this here.
        CustomizationItemsContainer(
          title: context.localization.button,
          children: [
            CustomizationMultilineTextField(
              value: widget.editable.buttonText ?? '',
              maxHeight: AppDimensions.maxTextFieldHeight,
              onChanged: (text) => widget.onChange(
                widget.editable.copyWith(buttonText: text),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
