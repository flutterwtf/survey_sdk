import 'package:flutter/material.dart';
import 'package:survey_sdk/src/domain/entities/actions/finish_survey_action.dart';
import 'package:survey_sdk/src/domain/entities/actions/go_to_action.dart';
import 'package:survey_sdk/src/domain/entities/actions/survey_action.dart';
import 'package:survey_sdk/src/domain/entities/actions/skip_question_action.dart';
import 'package:survey_sdk/src/domain/entities/question_types/question_data.dart';
import 'package:survey_sdk/src/presentation/survey/survey_controller.dart';

final class MainButtonCallback {
  final SurveyAction? mainButtonAction;
  final VoidCallback saveAnswer;
  final SurveyController surveyController;
  final List<QuestionData> questions;

  MainButtonCallback({
    required this.mainButtonAction,
    required this.saveAnswer,
    required this.surveyController,
    required this.questions,
  });

  void mainButtonCallbackFromType() => switch (mainButtonAction.runtimeType) {
        GoToAction => _goToCallback(),
        FinishSurveyAction => _finishSurveyCallback(),
        SkipQuestionAction => _skipSurveyCallback(),
        _ => _defaultSurveyCallback(),
      };

  void _goToCallback() {
    saveAnswer();
    surveyController.animateTo((mainButtonAction! as GoToAction).questionIndex);
  }

  void _finishSurveyCallback() {
    saveAnswer();
    surveyController.animateTo(questions.length);
  }

  void _skipSurveyCallback() {
    surveyController.onNext();
  }

  void _defaultSurveyCallback() {
    print('fff');
    saveAnswer();
    surveyController.onNext();
  }
}
