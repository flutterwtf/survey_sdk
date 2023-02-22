import 'package:flutter/material.dart';
import 'package:survey_admin/presentation/app/localization/localizations.dart';
import 'package:survey_admin/presentation/widgets/customization_panel/question_common_customization_panel.dart';
import 'package:survey_admin/presentation/widgets/customization_panel/question_content_customization_panel.dart';
import 'package:survey_admin/presentation/widgets/customization_panel/question_input_customization_panel.dart';
import 'package:survey_admin/presentation/widgets/question_settings_tab_bar.dart';

class InputQuestionCustomizationPage extends StatelessWidget {
  const InputQuestionCustomizationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return QuestionSettingsTabBar(
      panels: [
        QuestionCommonCustomizationPanel(
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
        QuestionInputCustomizationPanel(
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
          onInputTypeChanged: (inputType) {},
        ),
        QuestionContentCustomizationPanel(
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
