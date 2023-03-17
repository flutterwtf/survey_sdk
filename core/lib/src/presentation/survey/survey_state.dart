import 'package:survey_core/src/domain/entities/question_answer.dart';
import 'package:survey_core/src/domain/entities/survey_data.dart';

abstract class SurveyState {
  const SurveyState();
}

class SurveyLoadedState extends SurveyState {
  final SurveyData? surveyData;
  final Map<int, QuestionAnswer> answers;

  const SurveyLoadedState({this.surveyData, this.answers = const {}});

  SurveyLoadedState copyWith({
    SurveyData? surveyData,
    Map<int, QuestionAnswer>? answers,
  }) {
    return SurveyLoadedState(
      surveyData: surveyData ?? this.surveyData,
      answers: answers ?? this.answers,
    );
  }

  @override
  List<Object?> get props => [surveyData, answers];
}

class SurveyEmptyState extends SurveyState {
  const SurveyEmptyState();
}
