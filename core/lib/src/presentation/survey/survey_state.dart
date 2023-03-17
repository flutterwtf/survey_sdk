import 'package:equatable/equatable.dart';
import 'package:survey_core/src/domain/entities/survey_data.dart';

class SurveyState extends Equatable {
  final SurveyData? surveyData;

  const SurveyState({this.surveyData});

  SurveyState copyWith({SurveyData? surveyData}) {
    return SurveyState(surveyData: surveyData ?? this.surveyData);
  }

  @override
  List<Object?> get props => [surveyData];
}
