import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:survey_core/src/domain/entities/question_answer.dart';
import 'package:survey_core/src/domain/entities/survey_data.dart';
import 'package:survey_core/src/domain/repository_interfaces/survey_data_repository.dart';
import 'package:survey_core/src/presentation/survey/survey_state.dart';
import 'package:survey_core/survey_core.dart';

class SurveyCubit extends Cubit<SurveyState> {
  final SurveyDataRepository _surveyDataRepository;

  SurveyCubit(this._surveyDataRepository) : super(const SurveyEmptyState());

  // TODO(dev): split into two methods.
  Future<void> initData(String? filePath, SurveyData? surveyData) async {
    if (filePath != null) {
      final data = await _surveyDataRepository.getSurveyData(filePath);
      _setSurveyData(data);
    } else {
      if (surveyData != null) {
        _setSurveyData(surveyData);
      }
    }
  }

  void saveAnswer({required int index, required dynamic data}) {
    final currentState = state;
    if (currentState is SurveyLoadedState) {
      final answer = QuestionAnswer(data);
      final newAnswers = Map<int, QuestionAnswer>.of(currentState.answers);
      newAnswers[index] = answer;
      emit(currentState.copyWith(answers: newAnswers));
    }
  }

  void _setSurveyData(SurveyData surveyData) {
    emit(SurveyLoadedState(surveyData: surveyData));
    // final currentState = state;
    // if (currentState is SurveyLoadedState) {
    //   emit(currentState.copyWith(surveyData: surveyData));
    // }
  }
}
