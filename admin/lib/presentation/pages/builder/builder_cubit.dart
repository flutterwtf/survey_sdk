import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:survey_admin/domain/repository_interfaces/survey_data_repository.dart';
import 'package:survey_admin/presentation/pages/builder/builder_state.dart';
import 'package:survey_core/survey_core.dart';

class BuilderCubit extends Cubit<BuilderState> {
  final SurveyDataRepository _surveyDataRepository;

  BuilderCubit(this._surveyDataRepository)
      : super(
          BuilderState(
            selectedQuestion: null,
            surveyData: SurveyData.common(),
          ),
        ) {
    _init();
  }

  void select(QuestionData data) {
    emit(state.copyWith(selectedQuestion: data));
  }

  void add(QuestionData data) {
    final questions = List.of(state.surveyData.questions)..add(data);
    emit(
      state.copyWith(
        surveyData: state.surveyData.copyWith(questions: questions),
      ),
    );
  }

  void _init() {
    final surveyData =
        _surveyDataRepository.getSurveyData() ?? SurveyData.common();
    emit(state.copyWith(surveyData: surveyData));
  }
}
