import 'package:flutter/material.dart';
import 'package:survey_admin/presentation/app/localization/localizations.dart';
import 'package:survey_admin/presentation/utils/app_fonts.dart';
import 'package:survey_admin/presentation/utils/colors.dart';
import 'package:survey_admin/presentation/utils/constants/app_dimensions.dart';
import 'package:survey_admin/presentation/utils/theme_extension.dart';
import 'package:survey_admin/presentation/widgets/customization_items/color_customization_item.dart';
import 'package:survey_admin/presentation/widgets/customization_items/customization_items_container.dart';
import 'package:survey_admin/presentation/widgets/customization_items/customization_multiline_text_field.dart';
import 'package:survey_admin/presentation/widgets/customization_items/dropdown_customization_button.dart';
import 'package:survey_admin/presentation/widgets/customization_items/multiline_switch.dart';
import 'package:survey_admin/presentation/widgets/customization_items/padding_customization_item.dart';
import 'package:survey_admin/presentation/widgets/customization_panel/customization_tab.dart';
import 'package:survey_core/survey_core.dart';

class InputCustomizationTab extends CustomizationTab {
  final void Function(bool isMultiline, int lineAmount) onMultilineChanged;
  final ValueChanged<Color> onFillColorChanged;
  final ValueChanged<Color> onBorderColorChanged;
  final ValueChanged<double> onBorderSizeChanged;
  final ValueChanged<double> onBorderWidthChanged;
  final void Function(double size) onHorizontalPaddingChanged;
  final void Function(double size) onVerticalPaddingChanged;
  final ValueChanged<Color> onHintColorChanged;
  final ValueChanged<double> onHintFontSizeChanged;
  final ValueChanged<Color> onTextColorChanged;
  final ValueChanged<double> onTextFontSizeChanged;
  final ValueChanged<InputType> onInputTypeChanged;
  final InputType inputType;
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
    required this.inputType,
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
            ColorCustomizationItem(
              initialColor: AppColors.black,
              onColorPicked: onBorderColorChanged,
              initialSize: AppDimensions.defaultBorderWidth.toString(),
              onSizeChanged: onBorderWidthChanged,
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
            ColorCustomizationItem(
              initialColor: AppColors.textLightGrey,
              onColorPicked: onHintColorChanged,
              initialSize: AppFonts.sizeL.toString(),
              onSizeChanged: onHintFontSizeChanged,
            ),
          ],
        ),
        CustomizationItemsContainer(
          title: context.localization.text,
          children: [
            ColorCustomizationItem(
              initialColor: AppColors.black,
              onColorPicked: onTextColorChanged,
              initialSize: AppFonts.sizeL.toString(),
              onSizeChanged: onTextFontSizeChanged,
            ),
          ],
        ),
        CustomizationItemsContainer(
          title: context.localization.input_type,
          itemsPadding: const EdgeInsets.only(
            bottom: AppDimensions.marginM,
          ),
          children: [
            DropdownCustomizationButton<InputType>(
              items: InputType.values
                  .map(
                    (e) => DropdownCustomizationItem<InputType>(
                      value: e,
                      onChange: onInputTypeChanged,
                      child: Text(
                        e.name,
                        style: context.theme.textTheme.bodyLarge,
                      ),
                    ),
                  )
                  .toList(),
              value: inputType,
              withColor: true,
            ),
          ],
        ),
        CustomizationItemsContainer(
          title: context.localization.validator_error_text_title,
          children: [
            CustomizationMultilineTextField(
              maxHeight: AppDimensions.sizeXL,
              onChanged: onValidatorErrorTextChanged,
            ),
          ],
        ),
      ],
    );
  }
}
