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

  @override
  State<CustomizationTab> createState() => InputCustomizationTabState();
}

class InputCustomizationTabState
    extends CustomizationTabState<InputCustomizationTab> {
  @override
  Widget build(BuildContext context) {
    final theme = widget.editable.theme ?? const InputQuestionTheme.common();
    return ListView(
      children: [
        CustomizationItemsContainer(
          isTopDividerShown: true,
          children: [
            MultilineSwitch(
              onChanged: (isMultiline, lines) => widget.onChange(
                widget.editable.copyWith(
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
              initialColor: AppColors.white,
              onColorPicked: (color) => widget.onChange(
                widget.editable.copyWith(
                  theme: theme.copyWith(
                    backgroundColor: color,
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
              initialColor: AppColors.black,
              onColorPicked: (color) => widget.onChange(
                widget.editable.copyWith(
                  theme: theme.copyWith(
                    borderColor: color,
                  ),
                ),
              ),
              initialThickness: AppDimensions.defaultBorderWidth,
              onThicknessChanged: (width) => widget.onChange(
                widget.editable.copyWith(
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
              initialHorizontalPadding: AppDimensions.marginS,
              initialVerticalPadding: AppDimensions.marginS,
              // TODO(dev): Move theme change to a method.
              onHorizontalPaddingChange: (padding) => widget.onChange(
                widget.editable.copyWith(
                  theme: theme.copyWith(
                    horizontalPadding: padding,
                  ),
                ),
              ),
              onVerticalPaddingChange: (padding) => widget.onChange(
                widget.editable.copyWith(
                  theme: theme.copyWith(
                    verticalPadding: padding,
                  ),
                ),
              ),
            ),
          ],
        ),
        CustomizationItemsContainer(
          title: context.localization.hint,
          children: [
            TextStyleCustomizationItem(
              initialColor: AppColors.textLightGrey,
              onColorPicked: (color) => widget.onChange(
                widget.editable.copyWith(
                  theme: theme.copyWith(
                    hintColor: color,
                  ),
                ),
              ),
              initialSize: AppFonts.sizeL,
              onSizeChanged: (size) => widget.onChange(
                widget.editable.copyWith(
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
              initialColor: AppColors.black,
              onColorPicked: (color) => widget.onChange(
                widget.editable.copyWith(
                  theme: theme.copyWith(
                    textColor: color,
                  ),
                ),
              ),
              initialSize: AppFonts.sizeL,
              onSizeChanged: (size) => widget.onChange(
                widget.editable.copyWith(
                  theme: theme.copyWith(
                    textSize: size,
                  ),
                ),
              ),
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
                      onChange: (type) => widget.onChange(
                        widget.editable.copyWith(
                          theme: theme.copyWith(
                            inputType: type,
                          ),
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
          title: context.localization.validator_error_text_title,
          children: [
            CustomizationMultilineTextField(
              value: theme.errorText,
              maxHeight: AppDimensions.sizeXL,
              onChanged: (text) => widget.onChange(
                widget.editable.copyWith(
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
