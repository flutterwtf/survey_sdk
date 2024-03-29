import 'package:flutter/material.dart';
import 'package:survey_sdk/src/domain/entities/actions/finish_survey_action.dart';
import 'package:survey_sdk/src/domain/entities/actions/go_back_action.dart';
import 'package:survey_sdk/src/domain/entities/actions/go_next_action.dart';
import 'package:survey_sdk/src/domain/entities/actions/go_to_action.dart';
import 'package:survey_sdk/src/domain/entities/actions/skip_question_action.dart';
import 'package:survey_sdk/src/domain/entities/actions/survey_action.dart';
import 'package:survey_sdk/src/domain/entities/question_answer.dart';
import 'package:survey_sdk/src/domain/entities/question_types/question_data.dart';
import 'package:survey_sdk/src/presentation/survey/survey_controller.dart';
import 'package:survey_sdk/src/presentation/utils/callback_type.dart';
import 'package:survey_sdk/src/presentation/utils/on_finish_callback.dart';

class SurveyButtonCallback {
  final SurveyAction? callback;
  final VoidCallback? saveAnswer;
  final SurveyController surveyController;
  final List<QuestionData> questions;
  final OnFinishCallback? onFinish;
  final CallbackType callbackType;
  final Map<int, QuestionAnswer>? answers;

  SurveyButtonCallback({
    required this.callback,
    required this.saveAnswer,
    required this.surveyController,
    required this.questions,
    required this.callbackType,
    this.answers,
    this.onFinish,
  }) : assert(
          onFinish != null && answers != null || onFinish == null,
          'If onFinish != null answers should not be null either',
        );

  void callbackFromType() => switch (callback.runtimeType) {
        GoToAction => goToCallback(),
        FinishSurveyAction => finishSurveyCallback(),
        SkipQuestionAction => skipSurveyCallback(),
        GoNextAction => goNextCallback(),
        GoBackAction => goBackCallback(),
        _ => defaultSurveyCallback(),
      };

  @visibleForTesting
  void goToCallback() {
    saveAnswer?.call();
    surveyController.animateTo((callback! as GoToAction).questionIndex - 1);
  }

  @visibleForTesting
  void finishSurveyCallback() {
    saveAnswer?.call();
    onFinish?.call(answers!);
    surveyController.animateTo(questions.length);
  }

  @visibleForTesting
  void skipSurveyCallback() {
    surveyController.onNext();
  }

  @visibleForTesting
  void goNextCallback() {
    saveAnswer?.call();
    surveyController.onNext();
  }

  void goBackCallback() {
    surveyController.onBack();
  }

  @visibleForTesting
  void defaultSurveyCallback() => switch (callbackType) {
        CallbackType.primaryCallback => goNextCallback(),
        CallbackType.secondaryCallback => skipSurveyCallback(),
      };
}
