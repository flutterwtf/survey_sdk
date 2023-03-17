import 'package:survey_core/src/domain/entities/survey_data.dart';

class SurveyState {
  final SurveyData? surveyData;
  final Map<String, dynamic>? answer;

  SurveyState({this.surveyData, this.answer});

  SurveyState copyWith({
    SurveyData? surveyData,
    Map<String, dynamic>? answer,
  }) {
    return SurveyState(
      surveyData: surveyData ?? this.surveyData,
      answer: answer ?? this.answer,
    );
  }
}
