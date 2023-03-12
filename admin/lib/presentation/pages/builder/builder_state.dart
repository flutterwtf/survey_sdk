import 'package:equatable/equatable.dart';
import 'package:survey_core/survey_core.dart';

class BuilderState extends Equatable {
  final QuestionData? selectedQuestion;
  final List<QuestionData> questions;

  const BuilderState({
    required this.questions,
    required this.selectedQuestion,
  });

  BuilderState copyWith({
    QuestionData? selectedQuestion,
    List<QuestionData>? questions,
  }) {
    return BuilderState(
      questions: questions ?? this.questions,
      selectedQuestion: selectedQuestion ?? this.selectedQuestion,
    );
  }

  @override
  List<Object?> get props => [selectedQuestion, questions];
}
