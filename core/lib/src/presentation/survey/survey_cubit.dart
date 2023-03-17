import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:survey_core/src/domain/entities/question_answer.dart';
import 'package:survey_core/src/domain/repository_interfaces/survey_data_repository.dart';
import 'package:survey_core/src/presentation/survey/survey_state.dart';
import 'package:survey_core/survey_core.dart';

class SurveyCubit extends Cubit<SurveyState> {
  final SurveyDataRepository _surveyDataRepository;

  SurveyCubit(this._surveyDataRepository) : super(SurveyState());

  // void initData(String surveyDataAsset) {
  //   _surveyDataRepository.getSurveyData(surveyDataAsset).then(
  //         (data) => emit(state.copyWith(surveyData: data)),
  //       );
  // }
  void initData(String? filePath, SurveyData? surveyData) {
    if (filePath != null) {
      _surveyDataRepository.getSurveyData(filePath).then(
            (data) => emit(state.copyWith(surveyData: data)),
          );
    } else {
      emit(state.copyWith(surveyData: surveyData));
    }
  }

  void saveAnswer({required int key, required dynamic data}) {
    final answer = QuestionAnswer(key, data).toJson();
    emit(state.copyWith(answer: answer));
  }
  // saveAnswer(QuestionData data) {
  //   QuestionAnswer(data.index, 'rew').toJson();
  // }
}
