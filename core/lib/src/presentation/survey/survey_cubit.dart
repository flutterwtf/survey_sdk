import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:survey_core/src/domain/entities/question_answer.dart';
import 'package:survey_core/src/domain/entities/survey_data.dart';
import 'package:survey_core/src/domain/repository_interfaces/survey_data_repository.dart';
import 'package:survey_core/src/presentation/survey/survey_state.dart';
import 'package:survey_core/survey_core.dart';

class SurveyCubit extends Cubit<SurveyState> {
  final SurveyDataRepository _surveyDataRepository;

  SurveyCubit(this._surveyDataRepository) : super(const SurveyLoadedState());

  // // TODO(dev): split into two methods.
  Future<void> initData(String? filePath, SurveyData? surveyData) async {
    final currentState = state;
    if (currentState is SurveyLoadedState) {
      if (filePath != null) {
        final data = await _surveyDataRepository.getSurveyData(filePath);
        emit(currentState.copyWith(surveyData: data));
      } else {
        emit(currentState.copyWith(surveyData: surveyData));
      }
    }
  }

  void saveAnswer({required int index, required dynamic data}) {
    final answer = QuestionAnswer(data);
    final newAnswers = Map<int, QuestionAnswer>.of(state.answers);
    newAnswers[index] = answer;
    final currentState = state;
    if (currentState is SurveyLoadedState) {
      emit(state.copyWith(answers: newAnswers));
    }
  }
}
