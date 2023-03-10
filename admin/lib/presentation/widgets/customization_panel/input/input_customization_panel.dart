import 'package:flutter/material.dart';
import 'package:survey_admin/presentation/app/localization/localizations.dart';
import 'package:survey_admin/presentation/widgets/customization_items/input_type_customization_item.dart';
import 'package:survey_admin/presentation/widgets/customization_panel/input/input_common_customization_tab.dart';
import 'package:survey_admin/presentation/widgets/customization_panel/input/input_content_customization_tab.dart';
import 'package:survey_admin/presentation/widgets/customization_panel/input/input_customization_tab.dart';
import 'package:survey_admin/presentation/widgets/question_settings_tab_bar.dart';

// TODO(dev): why do we have pages in this folder?
class InputCustomizationPanel extends StatefulWidget {
  const InputCustomizationPanel({super.key});

  @override
  State<InputCustomizationPanel> createState() =>
      _InputCustomizationPanelState();
}

class _InputCustomizationPanelState extends State<InputCustomizationPanel> {
  InputType inputType = InputType.text;
  DateTime dateTime = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return QuestionSettingsTabBar(
      tabs: [
        InputCommonCustomizationTab(
          title: context.localization.common,
          onFillColorPicked: (color) {},
          onTitleColorPicked: (color) {},
          onTitleFontSizeChanged: (size) {},
          onSubtitleColorPicked: (color) {},
          onSubtitleFontSizeChanged: (size) {},
          onButtonFirstColorPicked: (color) {},
          onButtonSecondColorPicked: (color) {},
          onButtonFontSizeChanged: (size) {},
        ),
        InputCustomizationTab(
          key: UniqueKey(),
          title: context.localization.input,
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
          onInputTypeChanged: (newInputType) {
            setState(() {
              inputType = newInputType;
            });
          },
          onDateTimeChanged: (newDateTime) {
            setState(() {
              dateTime = newDateTime;
            });
          },
          inputType: inputType,
          dateTime: dateTime,
        ),
        InputContentCustomizationTab(
          title: context.localization.content,
          onTitleChanged: (text) {},
          onSubtitleChanged: (text) {},
          onHintTextChanged: (text) {},
          onButtonTextChanged: (text) {},
        ),
      ],
    );
  }
}
