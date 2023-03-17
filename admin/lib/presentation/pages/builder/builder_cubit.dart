import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:survey_admin/domain/repository_interfaces/survey_data_repository.dart';
import 'package:survey_admin/presentation/pages/builder/builder_state.dart';
import 'package:survey_core/survey_core.dart';

class BuilderCubit extends Cubit<BuilderState> {
  final SurveyDataRepository _surveyDataRepository;

  BuilderCubit(this._surveyDataRepository)
      :
        super(
          BuilderState(
            selectedQuestion: null,
            surveyData: SurveyData.common(),
          ),
        ) {
    _init();
  }

  void _init() {
    final surveyData =
        _surveyDataRepository.getSurveyData() ?? SurveyData.common();
    emit(state.copyWith(surveyData: surveyData));
  }

  void add(QuestionData questionData) {
    emit(
      state.copyWith(
        questions: [
          ...state.questions,
          questionData.copyWith(index: state.questions.length),
        ],
      ),
    );
  }

  void swapQuestions(int a, int b) {
    final firstIndex = a;
    var secondIndex = b;
    if (secondIndex > firstIndex) secondIndex--;

    final firstItem = state.questions[firstIndex];
    final secondItem = state.questions[secondIndex];
    final questions = [...state.questions];

    questions[firstIndex] = secondItem.copyWith(index: firstIndex);
    questions[secondIndex] = firstItem.copyWith(index: secondIndex);

    emit(
      state.copyWith(
        questions: questions,
      ),
    );
  }

  void updateSelectedQuestion(QuestionData question) {
    if (state.selectedQuestionId != null) {
      final questions = [...state.questions];
      questions[state.selectedQuestionId!] = question;
      emit(
        state.copyWith(
          questions: questions,
        ),
      );

  void addQuestionData(QuestionData data) {
    final questionList = List<QuestionData>.from(state.surveyData.questions)
      ..add(data);
    final surveyData = state.surveyData.copyWith(questions: questionList);
    _surveyDataRepository.saveSurveyData(surveyData);
    emit(state.copyWith(surveyData: surveyData));
  }
}
