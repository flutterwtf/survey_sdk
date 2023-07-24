import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:survey_sdk/src/domain/entities/question_answer.dart';
import 'package:survey_sdk/src/domain/repository_interfaces/survey_data_repository.dart';
import 'package:survey_sdk/src/presentation/survey/survey_state.dart';
import 'package:survey_sdk/src/presentation/utils/survey_button_callback.dart';

import 'package:survey_sdk/survey_sdk.dart';

/// A Cubit that manages the state and logic for the survey.
class SurveyCubit extends Cubit<SurveyState> {
  /// A repository responsible for retrieving survey data from a data source.
  final SurveyDataRepository _surveyDataRepository;

  SurveyCubit(this._surveyDataRepository) : super(const SurveyEmptyState());

  /// Initializes the survey data by loading it from the specified [filePath].
  /// If the [filePath] is not null, it retrieves the survey data using the
  /// [SurveyDataRepository].
  Future<void> initData(String? filePath) async {
    if (filePath != null) {
      final data = await _surveyDataRepository.getSurveyData(filePath);
      setSurveyData(data.$1, data.$2);
    }
  }

  void processCallback(
    SurveyController surveyController,
    int questionIndex,
    QuestionAnswer? answer,
    CallbackType callbackType, {
    required bool saveAnswer,
  }) {
    if (state is SurveyLoadedState) {
      final loadedState = state as SurveyLoadedState;
      final question = loadedState.surveyData.questions.firstWhere(
        (question) => question.index == questionIndex,
      );
      final callback = _callbackByType(callbackType, question);

      SurveyButtonCallback(
        callback: callback,
        callbackType: callbackType,
        surveyController: surveyController,
        questions: loadedState.surveyData.questions,
        saveAnswer: () => answer == null || !saveAnswer
            ? null
            : _saveAnswer(index: questionIndex, answer: answer),
      ).callbackFromType();
    }
  }

  /// Sets the survey data of the cubit to the provided [surveyData].
  void setSurveyData(SurveyData? surveyData, List<String> providedErrors) {
    emit(
      surveyData != null
          ? SurveyLoadedState(surveyData: surveyData)
          : SurveyErrorLoadState(
              providedErrors: providedErrors,
              errorState: SurveyErrorState.collapsed,
            ),
    );
  }

  void detailedError(SurveyErrorState errorState) {
    if (state is! SurveyErrorLoadState) return;

    emit(
      (state as SurveyErrorLoadState).copyWith(
        errorState: errorState,
      ),
    );
  }

  /// Saves the provided [answer] for the question at the specified [index].
  void _saveAnswer({required int index, required QuestionAnswer answer}) {
    final currentState = state;
    if (currentState is SurveyLoadedState) {
      final newAnswers = Map<int, QuestionAnswer>.of(currentState.answers);
      newAnswers[index] = answer;
      emit(currentState.copyWith(answers: newAnswers));
    }
  }

  SurveyAction? _callbackByType(
    CallbackType callbackType,
    QuestionData question,
  ) =>
      switch (callbackType) {
        CallbackType.primaryCallback => question.mainButtonAction,
        CallbackType.secondaryCallback => question.secondaryButtonAction,
      };
}
