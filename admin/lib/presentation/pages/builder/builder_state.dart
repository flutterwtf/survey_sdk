import 'package:equatable/equatable.dart';
import 'package:survey_core/survey_core.dart';

class BuilderState extends Equatable {
  final QuestionData? selectedQuestion;
  final SurveyData surveyData;

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

  @override
  List<Object?> get props => [selectedQuestion, surveyData];
}
