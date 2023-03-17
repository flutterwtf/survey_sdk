import 'package:equatable/equatable.dart';
import 'package:survey_core/src/domain/entities/question_answer.dart';
import 'package:survey_core/src/domain/entities/survey_data.dart';

class SurveyState extends Equatable {
  final SurveyData? surveyData;
  final Map<int, QuestionAnswer> answers;

  const SurveyState({this.surveyData, this.answers = const {}});

  SurveyState copyWith({
    SurveyData? surveyData,
    Map<int, QuestionAnswer>? answers,
  }) {
    return SurveyState(
      surveyData: surveyData ?? this.surveyData,
      answers: answers ?? this.answers,
    );
  }

  @override
  List<Object?> get props => [surveyData, answers];
}
