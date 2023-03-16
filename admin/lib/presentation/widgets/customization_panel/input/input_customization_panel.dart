import 'package:flutter/material.dart';
import 'package:survey_admin/presentation/app/localization/localizations.dart';
import 'package:survey_admin/presentation/utils/question_data_transformers.dart';
import 'package:survey_admin/presentation/widgets/customization_panel/input/input_common_customization_tab.dart';
import 'package:survey_admin/presentation/widgets/customization_panel/input/input_content_customization_tab.dart';
import 'package:survey_admin/presentation/widgets/customization_panel/input/input_customization_tab.dart';
import 'package:survey_admin/presentation/widgets/question_settings_tab_bar.dart';
import 'package:survey_core/survey_core.dart';

class InputCustomizationPanel extends StatefulWidget {
  // TODO(dev): may be we can find a better name?
  final InputQuestionTransformers transformers;

  const InputCustomizationPanel({required this.transformers, super.key});

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
          onFillColorPicked: widget.transformers.updateFillColor,
          onTitleColorPicked: widget.transformers.updateTitleColor,
          onTitleFontSizeChanged: widget.transformers.updateTitleFontSize,
          onSubtitleColorPicked: widget.transformers.updateSubtitleColor,
          onSubtitleFontSizeChanged: widget.transformers.updateSubtitleFontSize,
          onButtonFirstColorPicked: widget.transformers.updateButtonFirstColor,
          onButtonSecondColorPicked:
              widget.transformers.updateButtonSecondColor,
          onButtonFontSizeChanged: widget.transformers.updateButtonFontSize,
        ),
        InputCustomizationTab(
          key: UniqueKey(),
          title: context.localization.input,
          onMultilineChanged: widget.transformers.updateMultiline,
          onFillColorChanged: widget.transformers.updateFillColor,
          onBorderColorChanged: widget.transformers.updateBorderColor,
          onBorderSizeChanged: widget.transformers.updateBorderSize,
          onBorderWidthChanged: widget.transformers.updateBorderWidth,
          onHorizontalPaddingChanged:
              widget.transformers.updateHorizontalPadding,
          onVerticalPaddingChanged: widget.transformers.updateVerticalPadding,
          onHintColorChanged: widget.transformers.updateHintColor,
          onHintFontSizeChanged: widget.transformers.updateHintFontSize,
          onTextColorChanged: widget.transformers.updateTextColor,
          onTextFontSizeChanged: widget.transformers.updateTextFontSize,
          onInputTypeChanged: (newInputType) {
            widget.transformers.updateInputType(newInputType);
            setState(() {
              inputType = newInputType;
            });
          },
          inputType: inputType,
          onValidatorErrorTextChanged: (errorText) {},
        ),
        InputContentCustomizationTab(
          title: context.localization.content,
          onTitleChanged: widget.transformers.updateTitle,
          onSubtitleChanged: widget.transformers.updateSubtitle,
          onHintTextChanged: widget.transformers.updateHintText,
          onButtonTextChanged: widget.transformers.updateButtonText,
        ),
      ],
    );
  }
}
