import 'package:flutter/material.dart';
import 'package:survey_sdk/src/domain/entities/actions/finish_survey_action.dart';
import 'package:survey_sdk/src/domain/entities/actions/go_to_action.dart';
import 'package:survey_sdk/src/domain/entities/actions/skip_question_action.dart';
import 'package:survey_sdk/src/domain/entities/actions/survey_action.dart';
import 'package:survey_sdk/src/domain/entities/question_types/question_data.dart';
import 'package:survey_sdk/src/presentation/survey/survey_controller.dart';
import 'package:survey_sdk/src/presentation/utils/callback_types.dart';

final class SurveyButtonCallback {
  final SurveyAction? callback;
  final VoidCallback? saveAnswer;
  final SurveyController surveyController;
  final List<QuestionData> questions;
  final CallbackTypes callbackType;

  SurveyButtonCallback({
    required this.callback,
    required this.saveAnswer,
    required this.surveyController,
    required this.questions,
    required this.callbackType,
  });

  void callbackFromType() => switch (callback.runtimeType) {
        GoToAction => _goToCallback(),
        FinishSurveyAction => _finishSurveyCallback(),
        SkipQuestionAction => _skipSurveyCallback(),
        _ => _defaultSurveyCallback(),
      };

  void _goToCallback() {
    saveAnswer?.call();
    surveyController.animateTo((callback! as GoToAction).questionIndex - 1);
  }

  void _finishSurveyCallback() {
    saveAnswer?.call();
    surveyController.animateTo(questions.length);
  }

  void _skipSurveyCallback() {
    surveyController.onNext();
  }

  void _defaultSurveyCallback() => switch (callbackType) {
        CallbackTypes.primaryCallback => {
            saveAnswer?.call(),
            surveyController.onNext(),
          },
        CallbackTypes.secondaryCallback => {
            surveyController.onNext(),
          },
      };
}
