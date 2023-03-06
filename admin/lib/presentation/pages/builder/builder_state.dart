import 'package:equatable/equatable.dart';
import 'package:survey_core/survey_core.dart';

class BuilderState extends Equatable {
  final QuestionData? selectedQuestion;
  final List<QuestionData> questionsList;

  const BuilderState({
    required this.selectedQuestion,
    required this.questionsList,
  });

  BuilderState copyWith({
    QuestionData? selectedQuestion,
    List<QuestionData>? questionsList,
  }) {
    return BuilderState(
      selectedQuestion: selectedQuestion ?? this.selectedQuestion,
      questionsList: questionsList ?? this.questionsList,
    );
  }

  @override
  List<Object?> get props => [selectedQuestion, questionsList];
}
