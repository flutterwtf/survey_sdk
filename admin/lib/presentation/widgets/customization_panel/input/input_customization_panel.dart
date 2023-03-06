import 'package:flutter/material.dart';
import 'package:survey_admin/presentation/app/localization/localizations.dart';
import 'package:survey_admin/presentation/utils/question_data_transformers.dart';
import 'package:survey_admin/presentation/widgets/customization_panel/input/input_common_customization_tab.dart';
import 'package:survey_admin/presentation/widgets/customization_panel/input/input_content_customization_tab.dart';
import 'package:survey_admin/presentation/widgets/customization_panel/input/input_customization_tab.dart';
import 'package:survey_admin/presentation/widgets/question_settings_tab_bar.dart';

class InputCustomizationPanel extends StatelessWidget {
  final InputQuestionTransformers transformers;

  const InputCustomizationPanel({
    required this.transformers,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return QuestionSettingsTabBar(
      tabs: [
        InputCommonCustomizationTab(
          title: context.localization.common,
          onFillColorPicked: transformers.updateFillColor,
          onTitleColorPicked: transformers.updateTitleColor,
          onTitleFontSizeChanged: transformers.updateTitleFontSize,
          onSubtitleColorPicked: transformers.updateSubtitleColor,
          onSubtitleFontSizeChanged: transformers.updateSubtitleFontSize,
          onButtonFirstColorPicked: transformers.updateButtonFirstColor,
          onButtonSecondColorPicked: transformers.updateButtonSecondColor,
          onButtonFontSizeChanged: transformers.updateButtonFontSize,
        ),
        InputCustomizationTab(
          title: context.localization.input,
          onMultilineChanged: transformers.updateMultiline,
          onFillColorChanged: transformers.updateFillColor,
          onBorderColorChanged: transformers.updateBorderColor,
          onBorderSizeChanged: transformers.updateBorderSize,
          onBorderWidthChanged: transformers.updateBorderWidth,
          onHorizontalPaddingChanged: transformers.updateHorizontalPadding,
          onVerticalPaddingChanged: transformers.updateVerticalPadding,
          onHintColorChanged: transformers.updateHintColor,
          onHintFontSizeChanged: transformers.updateHintFontSize,
          onTextColorChanged: transformers.updateTextColor,
          onTextFontSizeChanged: transformers.updateTextFontSize,
          onInputTypeChanged: transformers.updateInputType,
        ),
        InputContentCustomizationTab(
          title: context.localization.content,
          onTitleChanged: transformers.updateTitle,
          onSubtitleChanged: transformers.updateSubtitle,
          onHintTextChanged: transformers.updateHintText,
          onButtonTextChanged: transformers.updateButtonText,
        ),
      ],
    );
  }
}
