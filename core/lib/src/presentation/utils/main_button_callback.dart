import 'package:flutter/material.dart';
import 'package:survey_sdk/src/domain/entities/actions/main_button_action/finish_survey_action.dart';
import 'package:survey_sdk/src/domain/entities/actions/main_button_action/go_to_action.dart';
import 'package:survey_sdk/src/domain/entities/actions/main_button_action/main_button_action.dart';
import 'package:survey_sdk/src/domain/entities/actions/main_button_action/skip_question_action.dart';
import 'package:survey_sdk/src/domain/entities/question_types/question_data.dart';
import 'package:survey_sdk/src/presentation/survey/survey_controller.dart';

final class MainButtonCallback {
  final MainButtonAction? mainButtonAction;
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
    saveAnswer();
    surveyController.onNext();
  }
}
