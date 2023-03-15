import 'package:equatable/equatable.dart';
import 'package:survey_core/survey_core.dart';

abstract class BuilderState extends Equatable {
  const BuilderState();
}

class EditQuestionBuilderState extends BuilderState {
  final QuestionData? selectedQuestion;

  const EditQuestionBuilderState({required this.selectedQuestion});

  BuilderState copyWith({QuestionData? selectedQuestion}) {
    return EditQuestionBuilderState(
      selectedQuestion: selectedQuestion ?? this.selectedQuestion,
    );
  }

  @override
  List<Object?> get props => [selectedQuestion];
}

class EditCommonThemeBuilderState extends BuilderState {
  const EditCommonThemeBuilderState();
  @override
  List<Object?> get props => [];
}
