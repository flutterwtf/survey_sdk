import 'package:equatable/equatable.dart';
import 'package:survey_core/src/domain/entities/survey_data.dart';

class SurveyState extends Equatable {
  final SurveyData? surveyData;
  final Map<String, dynamic>? answer;

  const SurveyState({this.surveyData, this.answer});

  SurveyState copyWith({
    SurveyData? surveyData,
    Map<String, dynamic>? answer,
  }) {
    return SurveyState(
      surveyData: surveyData ?? this.surveyData,
      answer: answer ?? this.answer,
    );
  }

  @override
  List<Object?> get props => [surveyData, answer];
}
