import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:survey_core/src/domain/entities/survey_data.dart';
import 'package:survey_core/src/domain/repository_interfaces/survey_data_repository.dart';
import 'package:survey_core/src/presentation/survey/survey_state.dart';

class SurveyCubit extends Cubit<SurveyState> {
  final SurveyDataRepository _surveyDataRepository;

  SurveyCubit(this._surveyDataRepository) : super(SurveyState());

  //TODO: rebuild this moment
  void initData(String? surveyDataAsset, SurveyData surveyData) {
    if (surveyDataAsset != null) {
      _surveyDataRepository.getSurveyData(surveyDataAsset).then(
            (data) => emit(state.copyWith(surveyData: data)),
          );
    } else {
      emit(state.copyWith(surveyData: surveyData));
    }
  }
}
