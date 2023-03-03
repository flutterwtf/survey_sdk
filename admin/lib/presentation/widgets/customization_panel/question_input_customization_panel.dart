import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:survey_admin/presentation/app/localization/localizations.dart';
import 'package:survey_admin/presentation/utils/colors.dart';
import 'package:survey_admin/presentation/utils/constants/constants.dart';
import 'package:survey_admin/presentation/utils/theme_extension.dart';
import 'package:survey_admin/presentation/widgets/customization_items/color_customization_item.dart';
import 'package:survey_admin/presentation/widgets/customization_items/customization_items_container.dart';
import 'package:survey_admin/presentation/widgets/customization_items/customization_widgets/customization_text_field.dart';
import 'package:survey_admin/presentation/widgets/customization_items/input_type_customization_item.dart';
import 'package:survey_admin/presentation/widgets/customization_items/multiline_switch.dart';
import 'package:survey_admin/presentation/widgets/customization_items/padding_customization_item.dart';
import 'package:survey_admin/presentation/widgets/customization_panel/customization_panel.dart';

class QuestionInputCustomizationPanel extends CustomizationPanel {
  final void Function(bool isMultiline, int lineAmount) onMultilineChanged;
  final ValueChanged<Color> onFillColorChanged;
  final ValueChanged<Color> onBorderColorChanged;
  final ValueChanged<int?> onBorderSizeChanged;
  final ValueChanged<int?> onBorderWidthChanged;
  final void Function(double size) onHorizontalPaddingChanged;
  final void Function(double size) onVerticalPaddingChanged;
  final ValueChanged<Color> onHintColorChanged;
  final ValueChanged<int?> onHintFontSizeChanged;
  final ValueChanged<Color> onTextColorChanged;
  final ValueChanged<int?> onTextFontSizeChanged;
  final ValueChanged<InputType> onInputTypeChanged;

  const QuestionInputCustomizationPanel({
    super.key,
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
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        CustomizationItemsContainer(
          isTopDividerShown: true,
          itemsPadding: const EdgeInsets.all(
            AppDimensions.marginM,
          ),
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
                      initialValue: '1',
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
                      onChanged: (size) {
                        if (size == null) {
                          onBorderWidthChanged(null);
                        } else {
                          onBorderWidthChanged(int.tryParse(size));
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
              initialHorizontalPadding: 14,
              initialVerticalPadding: 14,
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
                    initialValue: '16',
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      LengthLimitingTextInputFormatter(3),
                    ],
                    onChanged: (size) {
                      if (size == null) {
                        onHintFontSizeChanged(null);
                      } else {
                        onHintFontSizeChanged(int.tryParse(size));
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
                    initialValue: '16',
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      LengthLimitingTextInputFormatter(3),
                    ],
                    onChanged: (size) {
                      if (size == null) {
                        onTextFontSizeChanged(null);
                      } else {
                        onTextFontSizeChanged(int.tryParse(size));
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
            InputTypeCustomizationItem(
              onChanged: onInputTypeChanged,
            ),
          ],
        ),
      ],
    );
  }
}
