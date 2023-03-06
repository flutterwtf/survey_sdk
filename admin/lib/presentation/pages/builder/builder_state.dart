import 'package:equatable/equatable.dart';
import 'package:survey_core/survey_core.dart';

class BuilderState extends Equatable {
  final QuestionData? selectedQuestion;
  final SurveyData? surveyData;

  const BuilderState({
    required this.surveyData,
    required this.selectedQuestion,
  });

  BuilderState copyWith({
    QuestionData? selectedQuestion,
    SurveyData? surveyData,
  }) {
    return BuilderState(
      surveyData: surveyData ?? this.surveyData,
      selectedQuestion: selectedQuestion ?? this.selectedQuestion,
    );
  }

  @override
  List<Object?> get props => [selectedQuestion, surveyData];
}
