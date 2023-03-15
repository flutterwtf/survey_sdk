import 'package:flutter/material.dart';
import 'package:survey_admin/presentation/app/localization/localizations.dart';
import 'package:survey_admin/presentation/utils/app_fonts.dart';
import 'package:survey_admin/presentation/utils/colors.dart';
import 'package:survey_admin/presentation/utils/constants/app_dimensions.dart';
import 'package:survey_admin/presentation/utils/theme_extension.dart';
import 'package:survey_admin/presentation/widgets/customization_items/color_customization_item.dart';
import 'package:survey_admin/presentation/widgets/customization_items/customization_items_container.dart';
import 'package:survey_admin/presentation/widgets/customization_items/input_type_customization_item.dart';
import 'package:survey_admin/presentation/widgets/customization_items/multiline_switch.dart';
import 'package:survey_admin/presentation/widgets/customization_items/padding_customization_item.dart';

import 'package:survey_admin/presentation/widgets/customization_items/text_style_customization_item.dart';

import 'package:survey_admin/presentation/widgets/customization_items/validator_error_text_customization_item.dart';

import 'package:survey_admin/presentation/widgets/customization_panel/customization_tab.dart';
import 'package:survey_core/survey_core.dart';

class InputCustomizationTab extends CustomizationTab {
  final void Function(bool isMultiline, int lineAmount) onMultilineChanged;
  final ValueChanged<Color> onFillColorChanged;
  final ValueChanged<Color> onBorderColorChanged;
  final ValueChanged<int> onBorderSizeChanged;
  final ValueChanged<int> onBorderWidthChanged;
  final void Function(double size) onHorizontalPaddingChanged;
  final void Function(double size) onVerticalPaddingChanged;
  final ValueChanged<Color> onHintColorChanged;
  final ValueChanged<int> onHintFontSizeChanged;
  final ValueChanged<Color> onTextColorChanged;
  final ValueChanged<int> onTextFontSizeChanged;
  final ValueChanged<InputType> onInputTypeChanged;
  final ValueChanged<String> onValidatorErrorTextChanged;

  const InputCustomizationTab({
    required super.title,
    required this.onMultilineChanged,
    required this.onFillColorChanged,
    required this.onBorderColorChanged,
    required this.onBorderSizeChanged,
    required this.onBorderWidthChanged,
    required this.onHorizontalPaddingChanged,
    required this.onVerticalPaddingChanged,
    required this.onHintColorChanged,
    required this.onHintFontSizeChanged,
    required this.onTextColorChanged,
    required this.onTextFontSizeChanged,
    required this.onInputTypeChanged,
    required this.onValidatorErrorTextChanged,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        CustomizationItemsContainer(
          isTopDividerShown: true,
          children: [
            MultilineSwitch(
              onChanged: onMultilineChanged,
            ),
          ],
        ),
        CustomizationItemsContainer(
          title: context.localization.fill,
          children: [
            ColorCustomizationItem(
              initialColor: AppColors.white,
              onColorPicked: onFillColorChanged,
            ),
          ],
        ),
        CustomizationItemsContainer(
          title: context.localization.border,
          children: [
            TextStyleCustomizationItem(
              initialColor: AppColors.black,
              onColorPicked: onBorderColorChanged,
              initialFontSize: AppDimensions.defaultBorderWidth.toString(),
              onFontSizeChanged: (value) {
                final size = int.tryParse(value);
                if (size != null) {
                  onBorderWidthChanged(size);
                }
              },
              decoration: InputDecoration(
                isCollapsed: true,
                border: InputBorder.none,
                suffixText: context.localization.px,
                suffixStyle: context.theme.textTheme.bodyLarge,
              ),
            ),
          ],
        ),
        CustomizationItemsContainer(
          title: context.localization.padding,
          children: [
            PaddingCustomizationItem(
              initialHorizontalPadding: AppDimensions.marginS,
              initialVerticalPadding: AppDimensions.marginS,
              onHorizontalPaddingChange: onHorizontalPaddingChanged,
              onVerticalPaddingChange: onVerticalPaddingChanged,
            ),
          ],
        ),
        CustomizationItemsContainer(
          title: context.localization.hint,
          children: [
            TextStyleCustomizationItem(
              initialColor: AppColors.textLightGrey,
              onColorPicked: onHintColorChanged,
              initialFontSize: AppFonts.sizeL.toString(),
              onFontSizeChanged: (value) {
                final size = int.tryParse(value);
                if (size != null) {
                  onHintFontSizeChanged(size);
                }
              },
            ),
          ],
        ),
        CustomizationItemsContainer(
          title: context.localization.text,
          children: [
            TextStyleCustomizationItem(
              initialColor: AppColors.black,
              onColorPicked: onTextColorChanged,
              initialFontSize: AppFonts.sizeL.toString(),
              onFontSizeChanged: (value) {
                final size = int.tryParse(value);
                if (size != null) {
                  onTextFontSizeChanged(size);
                }
              },
            ),
          ],
        ),
        CustomizationItemsContainer(
          title: context.localization.input_type,
          itemsPadding: const EdgeInsets.only(
            bottom: AppDimensions.marginM,
          ),
          children: [
            InputTypeCustomizationItem(
              onChanged: onInputTypeChanged,
            ),
          ],
        ),
        CustomizationItemsContainer(
          title: context.localization.validator_error_text_title,
          itemsPadding: const EdgeInsets.only(
            bottom: AppDimensions.marginM,
          ),
          children: [
            ValidatorErrorTextCustomizationItem(
              onErrorTextChanged: onValidatorErrorTextChanged,
            ),
          ],
        ),
      ],
    );
  }
}
