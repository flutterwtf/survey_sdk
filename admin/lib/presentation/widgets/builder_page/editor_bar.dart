import 'dart:math';

import 'package:flutter/material.dart';
import 'package:survey_admin/presentation/widgets/customization_panel/choice/choice_customization_panel.dart';
import 'package:survey_admin/presentation/widgets/customization_panel/info/info_customization_panel.dart';
import 'package:survey_admin/presentation/widgets/customization_panel/input/input_customization_panel.dart';
import 'package:survey_admin/presentation/widgets/customization_panel/slider/slider_customization_panel.dart';
import 'package:survey_sdk/survey_sdk.dart';

class EditorBar extends StatelessWidget {
  final QuestionData? editableQuestion;
  final bool isEditMode;
  final void Function(QuestionData data) onChange;
  final int questionsAmount;

  const EditorBar({
    required this.onChange,
    required this.editableQuestion,
    required this.questionsAmount,
    this.isEditMode = true,
    super.key,
  });

  double _calculateWidth(BuildContext context) {
    if (!isEditMode) return 0;

    final freeSpaceWidth = MediaQuery.of(context).size.width -
        SurveyDimensions.surveyContentBarWidth;

    return min(SurveyDimensions.surveyEditorBarWidth, freeSpaceWidth);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: SurveyDurations.panelSwitchingDuration,
      color: SurveyColors.whitePrimaryBackground,
      width: _calculateWidth(context),
      child: OverflowBox(
        alignment: Alignment.topLeft,
        maxWidth: SurveyDimensions.surveyEditorBarWidth,
        child: Builder(
          builder: (context) {
            final questionData = editableQuestion;
            if (questionData != null) {
              switch (questionData.type) {
                case QuestionTypes.choice:
                  return ChoiceCustomizationPanel(
                    onChange: onChange,
                    editable: questionData as ChoiceQuestionData,
                    questionsAmount: questionsAmount,
                  );
                case QuestionTypes.input:
                  return InputCustomizationPanel(
                    onChange: onChange,
                    editable: questionData as InputQuestionData,
                    questionsAmount: questionsAmount,
                  );
                case QuestionTypes.info:
                  return InfoCustomizationPanel(
                    onChange: onChange,
                    editable: questionData as InfoQuestionData,
                    questionsAmount: questionsAmount,
                  );
                case QuestionTypes.slider:
                  return SliderCustomizationPanel(
                    onChange: onChange,
                    editable: questionData as SliderQuestionData,
                    questionsAmount: questionsAmount,
                  );
              }
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
