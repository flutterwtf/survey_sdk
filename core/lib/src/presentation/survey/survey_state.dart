import 'package:survey_core/src/domain/entities/survey_data.dart';

abstract class SurveyState {}

class SurveyInitialState extends SurveyState {
  final SurveyData? surveyData;

  SurveyInitialState({this.surveyData});

  SurveyInitialState copyWith({SurveyData? surveyData}) {
    return SurveyInitialState(surveyData: surveyData ?? this.surveyData);
  }
}

class SurveyLoadingState extends SurveyState {}
