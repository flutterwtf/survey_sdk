import 'package:flutter/material.dart';
import 'package:survey_admin/presentation/app/localization/app_localizations_ext.dart';
import 'package:survey_admin/presentation/utils/utils.dart';
import 'package:survey_admin/presentation/widgets/customization_items/color_customization_item.dart';
import 'package:survey_admin/presentation/widgets/customization_items/color_thickness_customization_item.dart';
import 'package:survey_admin/presentation/widgets/customization_items/customization_items_container.dart';
import 'package:survey_admin/presentation/widgets/customization_items/customization_multiline_text_field.dart';
import 'package:survey_admin/presentation/widgets/customization_items/dropdown_customization_button.dart';
import 'package:survey_admin/presentation/widgets/customization_items/multiline_switch.dart';
import 'package:survey_admin/presentation/widgets/customization_items/padding_customization_item.dart';
import 'package:survey_admin/presentation/widgets/customization_items/text_style_customization_item.dart';
import 'package:survey_admin/presentation/widgets/customization_panel/constants/customization_panel_dimensions.dart';
import 'package:survey_admin/presentation/widgets/customization_panel/customization_tab.dart';
import 'package:survey_core/survey_core.dart';

class InputCustomizationTab extends CustomizationTab {
  final void Function(QuestionData data) onChange;
  final InputQuestionData editable;

  const InputCustomizationTab({
    required this.onChange,
    required super.title,
    required this.editable,
    super.key,
  });

  InputQuestionTheme get theme =>
      editable.theme ?? const InputQuestionTheme.common();

  void _changeTheme({
    required double padding,
    required bool isHorizontal,
  }) {
    final newTheme = isHorizontal
        ? theme.copyWith(horizontalPadding: padding)
        : theme.copyWith(verticalPadding: padding);

    onChange(editable.copyWith(theme: newTheme));
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        CustomizationItemsContainer(
          shouldShowTopDivider: true,
          children: [
            MultilineSwitch(
              value: theme.isMultiline,
              lines: theme.lines,
              onChanged: (isMultiline, lines) => onChange(
                editable.copyWith(
                  theme: theme.copyWith(
                    isMultiline: isMultiline,
                    lines: lines,
                  ),
                ),
              ),
            ),
          ],
        ),
        CustomizationItemsContainer(
          title: context.localization.fill,
          children: [
            ColorCustomizationItem(
              initialColor: theme.inputFill,
              onColorPicked: (color) => onChange(
                editable.copyWith(
                  theme: theme.copyWith(
                    inputFill: color,
                  ),
                ),
              ),
            ),
          ],
        ),
        CustomizationItemsContainer(
          title: context.localization.border,
          children: [
            ColorThicknessCustomizationItem(
              initialColor: theme.borderColor,
              onColorPicked: (color) => onChange(
                editable.copyWith(
                  theme: theme.copyWith(
                    borderColor: color,
                  ),
                ),
              ),
              initialThickness: theme.borderWidth,
              maxThickness: CustomizationPanelDimensions.inputBorderMaxWidth,
              onThicknessChanged: (width) => onChange(
                editable.copyWith(
                  theme: theme.copyWith(
                    borderWidth: width,
                  ),
                ),
              ),
            ),
          ],
        ),
        CustomizationItemsContainer(
          title: context.localization.padding,
          children: [
            PaddingCustomizationItem(
              initialHorizontalPadding: theme.horizontalPadding,
              initialVerticalPadding: theme.verticalPadding,
              onHorizontalPaddingChange: (padding) => _changeTheme(
                padding: padding,
                isHorizontal: true,
              ),
              onVerticalPaddingChange: (padding) => _changeTheme(
                padding: padding,
                isHorizontal: false,
              ),
            ),
          ],
        ),
        CustomizationItemsContainer(
          title: context.localization.hint,
          children: [
            TextStyleCustomizationItem(
              initialColor: theme.hintColor,
              onColorPicked: (color) => onChange(
                editable.copyWith(
                  theme: theme.copyWith(
                    hintColor: color,
                  ),
                ),
              ),
              initialSize: theme.hintSize,
              onSizeChanged: (size) => onChange(
                editable.copyWith(
                  theme: theme.copyWith(
                    hintSize: size,
                  ),
                ),
              ),
            ),
          ],
        ),
        CustomizationItemsContainer(
          title: context.localization.text,
          children: [
            TextStyleCustomizationItem(
              initialColor: theme.textColor,
              onColorPicked: (color) => onChange(
                editable.copyWith(
                  theme: theme.copyWith(
                    textColor: color,
                  ),
                ),
              ),
              initialSize: theme.textSize,
              onSizeChanged: (size) => onChange(
                editable.copyWith(
                  theme: theme.copyWith(
                    textSize: size,
                  ),
                ),
              ),
            ),
          ],
        ),
        CustomizationItemsContainer(
          // key: UniqueKey(),
          title: context.localization.inputType,
          itemsPadding: const EdgeInsets.only(
            bottom: AppDimensions.marginM,
          ),
          children: [
            DropdownCustomizationButton<InputType>(
              items: InputType.values
                  .map(
                    (e) => DropdownCustomizationItem<InputType>(
                      value: e,
                      onChange: (type) => onChange(
                        editable.copyWith(
                          theme: theme.copyWith(
                            inputType: type,
                          ),
                          validator: InputValidator.fromType(type: type),
                        ),
                      ),
                      child: Text(
                        e.name,
                        style: context.theme.textTheme.bodyLarge,
                      ),
                    ),
                  )
                  .toList(),
              value: theme.inputType,
              withColor: true,
            ),
          ],
        ),
        CustomizationItemsContainer(
          title: context.localization.validatorErrorTextTitle,
          children: [
            CustomizationMultilineTextField(
              value: theme.errorText,
              maxHeight: AppDimensions.sizeXL,
              onChanged: (text) => onChange(
                editable.copyWith(
                  theme: theme.copyWith(
                    errorText: text,
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
