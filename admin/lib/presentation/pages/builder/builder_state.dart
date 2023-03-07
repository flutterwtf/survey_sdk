import 'package:equatable/equatable.dart';
import 'package:survey_core/survey_core.dart';

class BuilderState extends Equatable {
  final QuestionData? selectedQuestion;

  const BuilderState({required this.selectedQuestion});

  BuilderState copyWith({QuestionData? selectedQuestion}) {
    return BuilderState(
      selectedQuestion: selectedQuestion ?? this.selectedQuestion,
    );
  }

  @override
  List<Object?> get props => [selectedQuestion];
}
