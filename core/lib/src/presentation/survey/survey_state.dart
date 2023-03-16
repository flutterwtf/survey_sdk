import 'package:survey_core/src/domain/entities/survey_data.dart';

abstract class SurveyState {
  const SurveyState();
}

class SurveyLoadedState extends SurveyState {
  final SurveyData? surveyData;

  const SurveyLoadedState({this.surveyData});

  SurveyLoadedState copyWith({SurveyData? surveyData}) {
    return SurveyLoadedState(surveyData: surveyData ?? this.surveyData);
  }
}

class SurveyEmptyState extends SurveyState {
  const SurveyEmptyState();
}
