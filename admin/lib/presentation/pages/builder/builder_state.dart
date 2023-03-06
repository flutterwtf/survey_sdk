import 'package:equatable/equatable.dart';
import 'package:survey_core/survey_core.dart';

class BuilderState extends Equatable {
  final QuestionData? selectedQuestion;
  final List<QuestionData> questions;

  const BuilderState({
    required this.selectedQuestion,
    required this.questions,
  });

  BuilderState copyWith({
    QuestionData? selectedQuestion,
    List<QuestionData>? questions,
  }) {
    return BuilderState(
      selectedQuestion: selectedQuestion ?? this.selectedQuestion,
      questions: questions ?? this.questions,
    );
  }

  @override
  List<Object?> get props => [
        selectedQuestion,
        questions,
      ];
}
