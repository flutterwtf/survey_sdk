import 'package:survey_core/src/domain/entities/survey_data.dart';

class SurveyState {
  final SurveyData? surveyData;

  SurveyState({this.surveyData});

  SurveyState copyWith({SurveyData? surveyData}) {
    return SurveyState(surveyData: surveyData ?? this.surveyData);
  }
}