import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:survey_admin/presentation/app/localization/localizations.dart';
import 'package:survey_admin/presentation/utils/app_fonts.dart';
import 'package:survey_admin/presentation/utils/colors.dart';
import 'package:survey_admin/presentation/utils/constants/app_dimensions.dart';
import 'package:survey_admin/presentation/utils/theme_extension.dart';
import 'package:survey_admin/presentation/widgets/customization_items/color_customization_item.dart';
import 'package:survey_admin/presentation/widgets/customization_items/customization_items_container.dart';
import 'package:survey_admin/presentation/widgets/customization_items/customization_multiline_text_field.dart';
import 'package:survey_admin/presentation/widgets/customization_items/customization_widgets/customization_text_field.dart';
import 'package:survey_admin/presentation/widgets/customization_items/dropdown_customization_button.dart';
import 'package:survey_admin/presentation/widgets/customization_items/multiline_switch.dart';
import 'package:survey_admin/presentation/widgets/customization_items/padding_customization_item.dart';
import 'package:survey_admin/presentation/widgets/customization_panel/customization_tab.dart';
import 'package:survey_admin/presentation/widgets/customization_panel/input/input_customization_panel.dart';
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
            Row(
              children: [
                Flexible(
                  child: ColorCustomizationItem(
                    initialColor: AppColors.black,
                    onColorPicked: onBorderColorChanged,
                  ),
                ),
                Flexible(
                  child: SizedBox(
                    width: AppDimensions.margin4XL,
                    child: CustomizationTextField(
                      initialValue: AppDimensions.defaultBorderWidth.toString(),
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        LengthLimitingTextInputFormatter(3),
                      ],
                      decoration: InputDecoration(
                        isCollapsed: true,
                        border: InputBorder.none,
                        suffixText: context.localization.px,
                        suffixStyle: context.theme.textTheme.bodyLarge,
                      ),
                      onChanged: (value) {
                        if (value == null) return;

                        final size = int.tryParse(value);
                        if (size != null) {
                          onBorderWidthChanged(size);
                        }
                      },
                    ),
                  ),
                ),
              ],
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
            Row(
              children: [
                Flexible(
                  child: ColorCustomizationItem(
                    initialColor: AppColors.textLightGrey,
                    onColorPicked: onHintColorChanged,
                  ),
                ),
                Flexible(
                  child: CustomizationTextField(
                    initialValue: AppFonts.sizeL.toString(),
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      LengthLimitingTextInputFormatter(3),
                    ],
                    onChanged: (value) {
                      if (value == null) return;

                      final size = int.tryParse(value);
                      if (size != null) {
                        onHintFontSizeChanged(size);
                      }
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
        CustomizationItemsContainer(
          title: context.localization.text,
          children: [
            Row(
              children: [
                Flexible(
                  child: ColorCustomizationItem(
                    initialColor: AppColors.black,
                    onColorPicked: onTextColorChanged,
                  ),
                ),
                Flexible(
                  child: CustomizationTextField(
                    initialValue: AppFonts.sizeL.toString(),
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      LengthLimitingTextInputFormatter(3),
                    ],
                    onChanged: (value) {
                      if (value == null) return;

                      final size = int.tryParse(value);
                      if (size != null) {
                        onTextFontSizeChanged(size);
                      }
                    },
                  ),
                ),
              ],
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
