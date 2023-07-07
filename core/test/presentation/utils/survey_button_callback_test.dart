import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:survey_sdk/src/domain/entities/actions/finish_survey_action.dart';
import 'package:survey_sdk/src/domain/entities/actions/go_back_action.dart';
import 'package:survey_sdk/src/domain/entities/actions/go_next_action.dart';
import 'package:survey_sdk/src/domain/entities/actions/go_to_action.dart';
import 'package:survey_sdk/src/domain/entities/actions/skip_question_action.dart';
import 'package:survey_sdk/src/domain/entities/actions/survey_action.dart';
import 'package:survey_sdk/src/domain/entities/question_types/question_data.dart';
import 'package:survey_sdk/src/presentation/survey/survey_controller.dart';
import 'package:survey_sdk/src/presentation/utils/callback_types.dart';
import 'package:survey_sdk/src/presentation/utils/survey_button_callback.dart';

import '../../utils/mocked_entities.dart';

// ignore: prefer-match-file-name
class MockSurveyController extends Mock implements SurveyController {}

void main() {
  final mockedQuestions = <QuestionData>[
    MockedEntities.info1,
    MockedEntities.input1,
    MockedEntities.choice1,
    MockedEntities.slider1,
  ];

  group(
    'Survey callback util tests',
    () {
      test(
        'Should call when GoNextAction is action for button',
        () {
          final surveyButtonCallback = _surveyButtonCallbackByAction(
            const GoNextAction(),
            mockedQuestions,
          )..callbackFromType();

          verify(surveyButtonCallback.goNextCallback).called(1);
        },
      );

      test(
        'Should call when GoBackAction is action for button',
            () {
          final surveyButtonCallback = _surveyButtonCallbackByAction(
            const GoBackAction(),
            mockedQuestions,
          )..callbackFromType();

          verify(surveyButtonCallback.goBackCallback).called(1);

        },
      );

      test(
        'Should call when GoToAction is action for button',
            () {
          final surveyButtonCallback = _surveyButtonCallbackByAction(
            const GoToAction(questionIndex: 0),
            mockedQuestions,
          )..callbackFromType();

          verify(surveyButtonCallback.goToCallback).called(1);

        },
      );

      test(
        'Should call when FinishSurveyAction is action for button',
            () {
          final surveyButtonCallback = _surveyButtonCallbackByAction(
            const FinishSurveyAction(),
            mockedQuestions,
          )..callbackFromType();

          verify(surveyButtonCallback.finishSurveyCallback).called(1);

        },
      );

      test(
        'Should call when SkipQuestionAction is action for button',
            () {
          final surveyButtonCallback = _surveyButtonCallbackByAction(
            const SkipQuestionAction(),
            mockedQuestions,
          )..callbackFromType();

          verify(surveyButtonCallback.skipSurveyCallback).called(1);

        },
      );

      test(
        "Should call when passed null for button's action",
            () {
          final surveyButtonCallback = _surveyButtonCallbackByAction(
            null,
            mockedQuestions,
          )..callbackFromType();

          verify(surveyButtonCallback.defaultSurveyCallback).called(1);

        },
      );
    },
  );
}

SurveyButtonCallback _surveyButtonCallbackByAction(
  SurveyAction? callback,
  List<QuestionData> questions,
) {
  final mockedSurveyController = MockSurveyController();

  return SurveyButtonCallback(
    callback: callback,
    saveAnswer: null,
    surveyController: mockedSurveyController,
    questions: questions,
    callbackType: CallbackTypes.primaryCallback,
  );
}
