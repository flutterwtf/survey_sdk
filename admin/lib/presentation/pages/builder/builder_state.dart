import 'package:equatable/equatable.dart';
import 'package:survey_core/survey_core.dart';

abstract class BuilderState extends Equatable {
  final SurveyData surveyData;

  const BuilderState({
    required this.surveyData,
  });

  BuilderState copyWith({
    SurveyData? surveyData,
  });
}

class EditQuestionBuilderState extends BuilderState {
  final int selectedIndex;

  @override
  List<Object?> get props => [selectedIndex, surveyData];

  const EditQuestionBuilderState({
    required super.surveyData,
    required this.selectedIndex,
  });

  @override
  BuilderState copyWith({
    int? selectedIndex,
    SurveyData? surveyData,
  }) {
    return EditQuestionBuilderState(
      selectedIndex: selectedIndex ?? this.selectedIndex,
      surveyData: surveyData ?? this.surveyData,
    );
  }
}

class PreviewQuestionBuilderState extends BuilderState {
  final QuestionData? selectedQuestion;

  @override
  List<Object?> get props => [selectedQuestion, surveyData];

  const PreviewQuestionBuilderState({
    required super.surveyData,
    required this.selectedQuestion,
  });

  @override
  BuilderState copyWith({
    SurveyData? surveyData,
    QuestionData? selectedQuestion,
  }) {
    return PreviewQuestionBuilderState(
      surveyData: surveyData ?? this.surveyData,
      selectedQuestion: selectedQuestion ?? this.selectedQuestion,
    );
  }

}

class ImportSuccessSurveyDataBuilderState extends BuilderState {
  @override
  List<Object?> get props => [surveyData];

  const ImportSuccessSurveyDataBuilderState({
    required super.surveyData,
  });

  @override
  BuilderState copyWith({
    SurveyData? surveyData,
  }) {
    return ImportSuccessSurveyDataBuilderState(
      surveyData: surveyData ?? this.surveyData,
    );
  }
}

class ImportErrorSurveyDataBuilderState extends BuilderState {
  @override
  List<Object?> get props => [surveyData];

  const ImportErrorSurveyDataBuilderState({
    required super.surveyData,
  });

  @override
  BuilderState copyWith({
    SurveyData? surveyData,
  }) {
    return ImportErrorSurveyDataBuilderState(
      surveyData: surveyData ?? this.surveyData,
    );
  }
}
