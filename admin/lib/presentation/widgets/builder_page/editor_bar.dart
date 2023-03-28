import 'package:flutter/material.dart';
import 'package:survey_admin/presentation/utils/utils.dart';
import 'package:survey_admin/presentation/widgets/customization_panel/choice/choice_customization_panel.dart';
import 'package:survey_admin/presentation/widgets/customization_panel/input/input_customization_panel.dart';
import 'package:survey_admin/presentation/widgets/customization_panel/intro/intro_customization_panel.dart';
import 'package:survey_admin/presentation/widgets/customization_panel/slider/slider_customization_panel.dart';
import 'package:survey_core/survey_core.dart';

class EditorBar extends StatelessWidget {
  final QuestionData? editableQuestion;
  final void Function(QuestionData data) onChange;

  const EditorBar({
    required this.onChange,
    required this.editableQuestion,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.whitePrimaryBackground,
      width: AppDimensions.surveyEditorBarWidth,
      child: Builder(
        builder: (context) {
          final questionData = editableQuestion;
          if (questionData != null) {
            switch (questionData.type) {
              case QuestionTypes.choice:
                return ChoiceCustomizationPanel(
                  onChange: onChange,
                  editable: questionData as ChoiceQuestionData,
                );
              case QuestionTypes.input:
                return InputCustomizationPanel(
                  onChange: onChange,
                  editable: questionData as InputQuestionData,
                );
              case QuestionTypes.intro:
                return IntroCustomizationPanel(
                  onChange: onChange,
                  editable: questionData as IntroQuestionData,
                );
              case QuestionTypes.slider:
                return SliderCustomizationPanel(
                  onChange: onChange,
                  editable: questionData as SliderQuestionData,
                );
            }
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
