import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:survey_core/src/domain/repository_interfaces/survey_data_repository.dart';
import 'package:survey_core/src/presentation/survey/survey_state.dart';

class SurveyCubit extends Cubit<SurveyState> {
  final SurveyDataRepository _surveyDataRepository;

  SurveyCubit(this._surveyDataRepository) : super(SurveyInitialState());

  void initData(String surveyDataAsset) {
    final currentState = state;
    if (currentState is SurveyInitialState) {
      _surveyDataRepository.getSurveyData(surveyDataAsset).then(
            (data) => emit(currentState.copyWith(surveyData: data)),
          );
    }
  }
}
