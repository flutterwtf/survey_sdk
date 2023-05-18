import 'package:survey_sdk/src/domain/entities/question_answer.dart';
import 'package:survey_sdk/src/domain/entities/survey_data.dart';

abstract class SurveyState {
  const SurveyState();
}

/// Represents the state when the survey data is loaded.
class SurveyLoadedState extends SurveyState {
  /// The loaded survey data.
  final SurveyData surveyData;

  /// The map of question index to corresponding answer.
  final Map<int, QuestionAnswer> answers;

  List<Object?> get props => [surveyData, answers];

  const SurveyLoadedState({required this.surveyData, this.answers = const {}});

  SurveyLoadedState copyWith({
    SurveyData? surveyData,
    Map<int, QuestionAnswer>? answers,
  }) {
    return SurveyLoadedState(
      surveyData: surveyData ?? this.surveyData,
      answers: answers ?? this.answers,
    );
  }
}

/// Represents the initial empty state of the survey.
class SurveyEmptyState extends SurveyState {
  const SurveyEmptyState();
}
