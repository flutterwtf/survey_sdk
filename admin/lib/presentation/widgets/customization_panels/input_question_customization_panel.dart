import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:survey_admin/presentation/utils/app_fonts.dart';
import 'package:survey_admin/presentation/utils/colors.dart';
import 'package:survey_admin/presentation/utils/constants/constants.dart';
import 'package:survey_admin/presentation/widgets/customization_items/color_customization_item.dart';
import 'package:survey_admin/presentation/widgets/customization_items/create_text_customization_item.dart';
import 'package:survey_admin/presentation/widgets/customization_items/customization_items_container.dart';
import 'package:survey_admin/presentation/widgets/customization_items/customization_text_field.dart';
import 'package:survey_admin/presentation/widgets/customization_items/input_type_customization_item.dart';
import 'package:survey_admin/presentation/widgets/customization_items/multiline_switch.dart';
import 'package:survey_admin/presentation/widgets/customization_items/padding_customization_item.dart';
import 'package:survey_admin/presentation/widgets/customization_panel_tab_manager.dart';

typedef _ColorCallback = void Function(Color color);
typedef _SizeCallback = void Function(int? size);
typedef _TextCallback = void Function(String text);

class InputQuestionCustomizationPanel extends StatelessWidget {
  const InputQuestionCustomizationPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomizationPanelTabManager(
      pages: [
        CustomizationPanelTab(
          title: 'Common',
          child: _CommonCustomizationPanel(
            onFillColorPicked: (color) {},
            onTitleColorPicked: (color) {},
            onTitleFontSizeChanged: (size) {},
            onSubtitleColorPicked: (color) {},
            onSubtitleFontSizeChanged: (size) {},
            onButtonFirstColorPicked: (color) {},
            onButtonSecondColorPicked: (color) {},
            onButtonFontSizeChanged: (size) {},
          ),
        ),
        CustomizationPanelTab(
          title: 'Input',
          child: _InputCustomizationPanel(
            onMultilineChanged: (isMultiline, lineAmount) {},
            onFillColorChanged: (color) {},
            onBorderColorChanged: (color) {},
            onBorderSizeChanged: (size) {},
            onBorderWidthChanged: (size) {},
            onHorizontalPaddingChanged: (size) {},
            onVerticalPaddingChanged: (size) {},
            onHintColorChanged: (color) {},
            onHintFontSizeChanged: (size) {},
            onTextColorChanged: (color) {},
            onTextFontSizeChanged: (size) {},
            onInputTypeChanged: (inputType) {},
          ),
        ),
        CustomizationPanelTab(
          title: 'Content',
          child: _ContentCustomizationPanel(
            onTitleChanged: (text) {},
            onSubtitleChanged: (text) {},
            onHintTextChanged: (text) {},
            onButtonTextChanged: (text) {},
          ),
        ),
      ],
    );
  }
}

class _CommonCustomizationPanel extends StatelessWidget {
  final _ColorCallback onFillColorPicked;
  final _ColorCallback onTitleColorPicked;
  final _SizeCallback onTitleFontSizeChanged;
  final _ColorCallback onSubtitleColorPicked;
  final _SizeCallback onSubtitleFontSizeChanged;
  final _ColorCallback onButtonFirstColorPicked;
  final _ColorCallback onButtonSecondColorPicked;
  final _SizeCallback onButtonFontSizeChanged;

  const _CommonCustomizationPanel({
    required this.onFillColorPicked,
    required this.onTitleColorPicked,
    required this.onTitleFontSizeChanged,
    required this.onSubtitleColorPicked,
    required this.onSubtitleFontSizeChanged,
    required this.onButtonFirstColorPicked,
    required this.onButtonSecondColorPicked,
    required this.onButtonFontSizeChanged,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        CustomizationItemsContainer(
          title: 'Fill',
          isTopDividerShown: true,
          children: [
            ColorCustomizationItem(
              initialColor: AppColors.black,
              onColorPicked: onFillColorPicked,
            ),
          ],
        ),
        CustomizationItemsContainer(
          title: 'Title',
          children: [
            Row(
              children: [
                Flexible(
                  child: ColorCustomizationItem(
                    initialColor: AppColors.black,
                    onColorPicked: onTitleColorPicked,
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
                        onTitleFontSizeChanged(null);
                      } else {
                        onTitleFontSizeChanged(int.tryParse(size));
                      }
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
        CustomizationItemsContainer(
          title: 'Subtitle',
          children: [
            Row(
              children: [
                Flexible(
                  child: ColorCustomizationItem(
                    initialColor: AppColors.black,
                    onColorPicked: onSubtitleColorPicked,
                  ),
                ),
                Flexible(
                  child: CustomizationTextField(
                    initialValue: '12',
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      LengthLimitingTextInputFormatter(3),
                    ],
                    onChanged: (size) {
                      if (size == null) {
                        onSubtitleFontSizeChanged(null);
                      } else {
                        onSubtitleFontSizeChanged(int.tryParse(size));
                      }
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
        CustomizationItemsContainer(
          title: 'Button',
          children: [
            ColorCustomizationItem(
              initialColor: AppColors.black,
              onColorPicked: onButtonFirstColorPicked,
            ),
            Row(
              children: [
                Flexible(
                  child: ColorCustomizationItem(
                    initialColor: AppColors.white,
                    onColorPicked: onButtonSecondColorPicked,
                  ),
                ),
                Flexible(
                  child: CustomizationTextField(
                    initialValue: '12',
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      LengthLimitingTextInputFormatter(3),
                    ],
                    onChanged: (size) {
                      if (size == null) {
                        onButtonFontSizeChanged(null);
                      } else {
                        onButtonFontSizeChanged(int.tryParse(size));
                      }
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}

class _InputCustomizationPanel extends StatelessWidget {
  final void Function(bool isMultiline, int lineAmount) onMultilineChanged;
  final _ColorCallback onFillColorChanged;
  final _ColorCallback onBorderColorChanged;
  final _SizeCallback onBorderSizeChanged;
  final _SizeCallback onBorderWidthChanged;
  final void Function(double size) onHorizontalPaddingChanged;
  final void Function(double size) onVerticalPaddingChanged;
  final _ColorCallback onHintColorChanged;
  final _SizeCallback onHintFontSizeChanged;
  final _ColorCallback onTextColorChanged;
  final _SizeCallback onTextFontSizeChanged;
  final void Function(InputType inputType) onInputTypeChanged;

  const _InputCustomizationPanel({
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
          title: 'Fill',
          children: [
            ColorCustomizationItem(
              initialColor: AppColors.white,
              onColorPicked: onFillColorChanged,
            ),
          ],
        ),
        CustomizationItemsContainer(
          title: 'Border',
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
                    width: AppDimensions.margin3XL,
                    child: CustomizationTextField(
                      initialValue: '1',
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        LengthLimitingTextInputFormatter(3),
                      ],
                      decoration: const InputDecoration(
                        isCollapsed: true,
                        border: InputBorder.none,
                        suffixText: 'px',
                        suffixStyle: TextStyle(
                          fontSize: AppFonts.sizeL,
                          fontWeight: AppFonts.weightRegular,
                        ),
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
          title: 'Padding',
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
          title: 'Hint',
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
          title: 'Text',
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
          title: 'Input type',
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

class _ContentCustomizationPanel extends StatelessWidget {
  final _TextCallback onTitleChanged;
  final _TextCallback onSubtitleChanged;
  final _TextCallback onHintTextChanged;
  final _TextCallback onButtonTextChanged;

  const _ContentCustomizationPanel({
    required this.onTitleChanged,
    required this.onSubtitleChanged,
    required this.onHintTextChanged,
    required this.onButtonTextChanged,
  });

  static const double _maxInputTextHeight = 100;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        CustomizationItemsContainer(
          title: 'Title',
          isTopDividerShown: true,
          children: [
            CreateTextCustomizationItem(
              maxHeight: _maxInputTextHeight,
              onChanged: onTitleChanged,
            ),
          ],
        ),
        CustomizationItemsContainer(
          title: 'Subtitle',
          children: [
            CreateTextCustomizationItem(
              maxHeight: _maxInputTextHeight,
              onChanged: onSubtitleChanged,
            ),
          ],
        ),
        CustomizationItemsContainer(
          title: 'Hint',
          children: [
            CreateTextCustomizationItem(
              maxHeight: _maxInputTextHeight,
              onChanged: onHintTextChanged,
            ),
          ],
        ),
        CustomizationItemsContainer(
          title: 'Button',
          children: [
            CreateTextCustomizationItem(
              maxHeight: _maxInputTextHeight,
              onChanged: onButtonTextChanged,
            ),
          ],
        ),
      ],
    );
  }
}
