import 'package:equatable/equatable.dart';
import 'package:survey_core/survey_core.dart';

class BuilderState extends Equatable {
  final SurveyData surveyData;
  final QuestionData? selectedQuestion;

  const BuilderState({
    required this.selectedQuestion,
    required this.surveyData,
  });

  BuilderState copyWith({
    QuestionData? selectedQuestion,
    SurveyData? surveyData,
  }) {
    return BuilderState(
      selectedQuestion: selectedQuestion ?? this.selectedQuestion,
      surveyData: surveyData ?? this.surveyData,
    );
  }

  QuestionData? get selectedQuestion =>
      selectedQuestionId != null ? questions[selectedQuestionId!] : null;

  @override
  List<Object?> get props => [selectedQuestion, surveyData];
}
