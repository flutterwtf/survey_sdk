import 'package:equatable/equatable.dart';
import 'package:survey_core/survey_core.dart';

class BuilderState extends Equatable {
  final int? selectedQuestionId;
  final List<QuestionData> questions;

  const BuilderState({
    required this.selectedQuestionId,
    required this.questions,
  });

  BuilderState copyWith({
    int? selectedQuestionId,
    List<QuestionData>? questions,
  }) {
    return BuilderState(
      selectedQuestionId: selectedQuestionId ?? this.selectedQuestionId,
      questions: questions ?? this.questions,
    );
  }

  QuestionData? get selectedQuestion =>
      selectedQuestionId != null ? questions[selectedQuestionId!] : null;

  @override
  List<Object?> get props => [
        selectedQuestionId,
        questions,
      ];
}
