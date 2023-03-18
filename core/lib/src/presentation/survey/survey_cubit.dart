import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:survey_core/src/domain/entities/question_answer.dart';
import 'package:survey_core/src/domain/entities/survey_data.dart';
import 'package:survey_core/src/domain/repository_interfaces/survey_data_repository.dart';
import 'package:survey_core/src/presentation/survey/survey_state.dart';
import 'package:survey_core/survey_core.dart';

class SurveyCubit extends Cubit<SurveyState> {
  final SurveyDataRepository _surveyDataRepository;

  SurveyCubit(this._surveyDataRepository) : super(const SurveyState());

  // // TODO(dev): split into two methods.
  Future<void> initData(String? filePath, SurveyData? surveyData) async {
    if (filePath != null) {
      final data = await _surveyDataRepository.getSurveyData(filePath);
      emit(state.copyWith(surveyData: data));
    } else {
      emit(state.copyWith(surveyData: surveyData));
    }
  }

  void saveAnswer({required int index, required QuestionAnswer answer}) {
    final newAnswers = Map<int, QuestionAnswer>.of(state.answers);
    newAnswers[index] = answer;
    emit(state.copyWith(answers: newAnswers));
  }
}
