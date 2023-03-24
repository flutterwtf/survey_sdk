import 'package:flutter/material.dart';
import 'package:survey_admin/presentation/app/localization/app_localizations_ext.dart';
import 'package:survey_admin/presentation/widgets/customization_panel/input/input_common_customization_tab.dart';
import 'package:survey_admin/presentation/widgets/customization_panel/input/input_content_customization_tab.dart';
import 'package:survey_admin/presentation/widgets/customization_panel/input/input_customization_tab.dart';
import 'package:survey_admin/presentation/widgets/question_settings_tab_bar.dart';
import 'package:survey_core/survey_core.dart';

class InputCustomizationPanel extends StatefulWidget {
  const InputCustomizationPanel({super.key});

  @override
  State<InputCustomizationPanel> createState() =>
      _InputCustomizationPanelState();
}

class _InputCustomizationPanelState extends State<InputCustomizationPanel> {
  InputType inputType = InputType.text;

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
          onMultilineChanged: ({
            required bool isMultiline,
            required int lineAmount,
          }) {},
          onFillColorChanged: (color) {},
          onBorderColorChanged: (color) {},
          onBorderSizeChanged: (size) {},
          onBorderWidthChanged: (size) {},
          onHorizontalPaddingUpdate: (size) {},
          onVerticalPaddingUpdate: (size) {},
          onHintColorChanged: (color) {},
          onHintFontSizeChanged: (size) {},
          onTextColorChanged: (color) {},
          onTextFontSizeChanged: (size) {},
          onInputTypeChanged: (newInputType) {
            setState(() {
              inputType = newInputType;
            });
          },
          inputType: inputType,
          onValidatorErrorChanged: (errorText) {},
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
