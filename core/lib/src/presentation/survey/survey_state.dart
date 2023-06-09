import 'package:survey_sdk/src/domain/entities/question_answer.dart';
import 'package:survey_sdk/src/domain/entities/survey_data.dart';
import 'package:survey_sdk/src/presentation/utils/survey_error_state.dart';

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

class SurveyErrorLoadState extends SurveyState {
  final List<String> providedErrors;
  final SurveyErrorState errorState;

  List<Object?> get props => [
        providedErrors,
        errorState,
      ];

  const SurveyErrorLoadState({
    required this.providedErrors,
    required this.errorState,
  });

  SurveyErrorLoadState copyWith({
    List<String>? providedErrors,
    SurveyErrorState? errorState,
  }) {
    return SurveyErrorLoadState(
      providedErrors: providedErrors ?? this.providedErrors,
      errorState: errorState ?? this.errorState,
    );
  }
}

/// Represents the initial empty state of the survey.
class SurveyEmptyState extends SurveyState {
  const SurveyEmptyState();
}
