import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:survey_core/src/domain/entities/question_answer.dart';
import 'package:survey_core/src/domain/repository_interfaces/survey_data_repository.dart';
import 'package:survey_core/src/presentation/survey/survey_state.dart';
import 'package:survey_core/survey_core.dart';

class SurveyCubit extends Cubit<SurveyState> {
  final SurveyDataRepository _surveyDataRepository;

  SurveyCubit(this._surveyDataRepository) : super(SurveyState());

  void initData(String surveyDataAsset) {
    _surveyDataRepository.getSurveyData(surveyDataAsset).then(
          (data) => emit(state.copyWith(surveyData: data)),
        );
  }

  saveAnswer(QuestionData data) {
      QuestionAnswer.toJson();
    }
}
