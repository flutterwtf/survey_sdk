import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:survey_admin/presentation/utils/colors.dart';
import 'package:survey_admin/presentation/utils/constants/constants.dart';
import 'package:survey_admin/presentation/widgets/customization_items/color_customization_item.dart';
import 'package:survey_admin/presentation/widgets/customization_items/create_text_customization_item.dart';
import 'package:survey_admin/presentation/widgets/customization_items/customization_items_container.dart';
import 'package:survey_admin/presentation/widgets/customization_items/customization_text_field.dart';
import 'package:survey_admin/presentation/widgets/customization_items/input_type_customization_item.dart';
import 'package:survey_admin/presentation/widgets/customization_items/multiline_switch.dart';
import 'package:survey_admin/presentation/widgets/customization_items/padding_customization_item.dart';
import 'package:survey_admin/presentation/widgets/question_settings_tab_bar.dart';

typedef _ColorCallback = void Function(Color color);
typedef _SizeCallback = void Function(int? size);
typedef _TextCallback = void Function(String text);

class InputQuestionCustomizationPanel extends StatefulWidget {
  const InputQuestionCustomizationPanel({super.key});

  @override
  State<InputQuestionCustomizationPanel> createState() =>
      _InputQuestionCustomizationPanelState();
}

class _InputQuestionCustomizationPanelState
    extends State<InputQuestionCustomizationPanel>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: 3,
      vsync: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return QuestionSettingsTabBar(
      tabTitles: const ['Common', 'Input', 'Content'],
      questionSettings: [
        QuestionSettingsListItem(
          'Common',
          _CommonCustomizationPanel(
            onFillColorPicked: (Color color) {},
            onTitleColorPicked: (Color color) {},
            onTitleSizeChanged: (int? size) {},
            onSubtitleColorPicked: (Color color) {},
            onSubtitleSizeChanged: (int? size) {},
            onButtonFirstColorPicked: (Color color) {},
            onButtonSecondColorPicked: (Color color) {},
            onButtonTextSizeChanged: (int? size) {},
          ),
        ),
        QuestionSettingsListItem(
          'Input',
          _InputCustomizationPanel(
            onMultilineChanged: (bool isMultiline, int lineAmount) {},
            onFillColorChanged: (Color color) {},
            onBorderColorChanged: (Color color) {},
            onBorderSizeChanged: (int? size) {},
            onBorderWidthChanged: (int? size) {},
            onHorizontalPaddingChanged: (double size) {},
            onVerticalPaddingChanged: (double size) {},
            onHintColorChanged: (Color color) {},
            onHintSizeChanged: (int? size) {},
            onTextColorChanged: (Color color) {},
            onTextSizeChanged: (int? size) {},
            onInputTypeChanged: (InputType inputType) {},
          ),
        ),
        QuestionSettingsListItem(
          'Content',
          _ContentCustomizationPanel(
            onTitleChanged: (String text) {},
            onSubtitleChanged: (String text) {},
            onHintTextChanged: (String text) {},
            onButtonTextChanged: (String text) {},
          ),
        ),
      ],
      tabController: _tabController,
    );
  }
}

class _CommonCustomizationPanel extends StatelessWidget {
  final _ColorCallback onFillColorPicked;
  final _ColorCallback onTitleColorPicked;
  final _SizeCallback onTitleSizeChanged;
  final _ColorCallback onSubtitleColorPicked;
  final _SizeCallback onSubtitleSizeChanged;
  final _ColorCallback onButtonFirstColorPicked;
  final _ColorCallback onButtonSecondColorPicked;
  final _SizeCallback onButtonTextSizeChanged;

  const _CommonCustomizationPanel({
    required this.onFillColorPicked,
    required this.onTitleColorPicked,
    required this.onTitleSizeChanged,
    required this.onSubtitleColorPicked,
    required this.onSubtitleSizeChanged,
    required this.onButtonFirstColorPicked,
    required this.onButtonSecondColorPicked,
    required this.onButtonTextSizeChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        CustomizationItemsContainer(
          title: 'Fill',
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
                  flex: 1,
                  child: ColorCustomizationItem(
                    initialColor: AppColors.black,
                    onColorPicked: onTitleColorPicked,
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: CustomizationTextField(
                    initialValue: '16',
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      LengthLimitingTextInputFormatter(3),
                    ],
                    onChanged: (size) {
                      if (size == null) {
                        onTitleSizeChanged(null);
                      } else {
                        onTitleSizeChanged(int.tryParse(size));
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
                  flex: 1,
                  child: ColorCustomizationItem(
                    initialColor: AppColors.black,
                    onColorPicked: onSubtitleColorPicked,
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: CustomizationTextField(
                    initialValue: '12',
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      LengthLimitingTextInputFormatter(3),
                    ],
                    onChanged: (size) {
                      if (size == null) {
                        onTitleSizeChanged(null);
                      } else {
                        onTitleSizeChanged(int.tryParse(size));
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
                  flex: 1,
                  child: ColorCustomizationItem(
                    initialColor: AppColors.white,
                    onColorPicked: onButtonSecondColorPicked,
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: CustomizationTextField(
                    initialValue: '12',
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      LengthLimitingTextInputFormatter(3),
                    ],
                    onChanged: (size) {
                      if (size == null) {
                        onTitleSizeChanged(null);
                      } else {
                        onTitleSizeChanged(int.tryParse(size));
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
  final _SizeCallback onHintSizeChanged;
  final _ColorCallback onTextColorChanged;
  final _SizeCallback onTextSizeChanged;
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
    required this.onHintSizeChanged,
    required this.onTextColorChanged,
    required this.onTextSizeChanged,
    required this.onInputTypeChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        CustomizationItemsContainer(
          itemsPadding: const EdgeInsets.all(AppDimensions.marginM),
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
              initialColor: AppColors.black,
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
                  flex: 1,
                  child: ColorCustomizationItem(
                    initialColor: AppColors.white,
                    onColorPicked: onBorderColorChanged,
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: CustomizationTextField(
                    initialValue: '12',
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      LengthLimitingTextInputFormatter(3),
                    ],
                    onChanged: (size) {
                      if (size == null) {
                        onBorderWidthChanged(null);
                      } else {
                        onBorderWidthChanged(int.tryParse(size));
                      }
                    },
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
                  flex: 1,
                  child: ColorCustomizationItem(
                    initialColor: AppColors.textLightGrey,
                    onColorPicked: onHintColorChanged,
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: CustomizationTextField(
                    initialValue: '12',
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      LengthLimitingTextInputFormatter(3),
                    ],
                    onChanged: (size) {
                      if (size == null) {
                        onHintSizeChanged(null);
                      } else {
                        onHintSizeChanged(int.tryParse(size));
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
                  flex: 1,
                  child: ColorCustomizationItem(
                    initialColor: AppColors.black,
                    onColorPicked: onTextColorChanged,
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: CustomizationTextField(
                    initialValue: '16',
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      LengthLimitingTextInputFormatter(3),
                    ],
                    onChanged: (size) {
                      if (size == null) {
                        onTextSizeChanged(null);
                      } else {
                        onTextSizeChanged(int.tryParse(size));
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

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        CustomizationItemsContainer(
          title: 'Title',
          children: [
            CreateTextCustomizationItem(
              maxHeight: 100,
              onChanged: onTitleChanged,
            ),
          ],
        ),
        CustomizationItemsContainer(
          title: 'Subtitle',
          children: [
            CreateTextCustomizationItem(
              maxHeight: 100,
              onChanged: onSubtitleChanged,
            ),
          ],
        ),
        CustomizationItemsContainer(
          title: 'Hint',
          children: [
            CreateTextCustomizationItem(
              maxHeight: 100,
              onChanged: onHintTextChanged,
            ),
          ],
        ),
        CustomizationItemsContainer(
          title: 'Button',
          children: [
            CreateTextCustomizationItem(
              maxHeight: 100,
              onChanged: onButtonTextChanged,
            ),
          ],
        ),
      ],
    );
  }
}
