import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:survey_core/src/domain/entities/question_answer.dart';
import 'package:survey_core/src/domain/entities/survey_data.dart';
import 'package:survey_core/src/domain/repository_interfaces/survey_data_repository.dart';
import 'package:survey_core/src/presentation/survey/survey_state.dart';
import 'package:survey_core/survey_core.dart';

class SurveyCubit extends Cubit<SurveyState> {
  final SurveyDataRepository _surveyDataRepository;

  SurveyCubit(this._surveyDataRepository) : super(const SurveyEmptyState());

  Future<void> initData(String? filePath) async {
    if (filePath != null) {
      final data = await _surveyDataRepository.getSurveyData(filePath);
      setSurveyData(data);
    }
  }

  void saveAnswer({required int index, required QuestionAnswer answer}) {
    final currentState = state;
    if (currentState is SurveyLoadedState) {
      final newAnswers = Map<int, QuestionAnswer>.of(currentState.answers);
      newAnswers[index] = answer;
      emit(currentState.copyWith(answers: newAnswers));
    }
  }

  void setSurveyData(SurveyData surveyData) {
    emit(SurveyLoadedState(surveyData: surveyData));
  }
}
