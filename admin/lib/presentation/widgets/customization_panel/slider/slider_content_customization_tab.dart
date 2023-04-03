import 'package:flutter/material.dart';
import 'package:survey_admin/presentation/app/localization/app_localizations_ext.dart';
import 'package:survey_admin/presentation/utils/constants/app_dimensions.dart';
import 'package:survey_admin/presentation/utils/utils.dart';
import 'package:survey_admin/presentation/widgets/customization_items/customization_items_container.dart';
import 'package:survey_admin/presentation/widgets/customization_items/customization_multiline_text_field.dart';
import 'package:survey_admin/presentation/widgets/customization_items/divisions_customization_item.dart';
import 'package:survey_admin/presentation/widgets/customization_items/min_max_customization_item.dart';
import 'package:survey_admin/presentation/widgets/customization_panel/customization_tab.dart';
import 'package:survey_core/survey_core.dart';

class SliderContentCustomizationTab extends CustomizationTab {
  final void Function(QuestionData data) onChange;
  final SliderQuestionData editable;

  const SliderContentCustomizationTab({
    required this.onChange,
    required super.title,
    required this.editable,
    super.key,
  });

  @override
  State<CustomizationTab> createState() => SliderContentCustomizationTabState();
}

class SliderContentCustomizationTabState
    extends CustomizationTabState<SliderContentCustomizationTab> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        CustomizationItemsContainer(
          title: context.localization.title,
          shouldShowTopDivider: true,
          children: [
            CustomizationMultilineTextField(
              value: widget.editable.title,
              maxHeight: AppDimensions.sizeXL,
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
              maxHeight: AppDimensions.sizeXL,
              onChanged: (subtitle) => widget.onChange(
                widget.editable.copyWith(subtitle: subtitle),
              ),
            ),
          ],
        ),
        CustomizationItemsContainer(
          title: context.localization.value,
          children: [
            MinMaxCustomizationItem(
              initialMax: widget.editable.maxValue,
              initialMin: widget.editable.minValue,
              onChanged: (min, max) => widget.onChange(
                widget.editable.copyWith(minValue: min, maxValue: max),
              ),
            ),
          ],
        ),
        CustomizationItemsContainer(
          title: context.localization.divisions,
          children: [
            DivisionsCustomizationItem(
              initialValue: widget.editable.initialValue,
              onChanged: (divisions) => widget.onChange(
                widget.editable.copyWith(divisions: divisions),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
