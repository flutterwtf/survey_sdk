import 'package:equatable/equatable.dart';
import 'package:survey_core/survey_core.dart';

abstract class BuilderState extends Equatable {
  final SurveyData surveyData;

  const BuilderState(this.surveyData);

  BuilderState copyWith({SurveyData? surveyData});
}

class EditQuestionBuilderState extends BuilderState {
  final QuestionData? selectedQuestion;

  @override
  List<Object?> get props => [selectedQuestion, surveyData];

  const EditQuestionBuilderState({
    required this.selectedQuestion,
    required SurveyData surveyData,
  }) : super(surveyData);

  @override
  BuilderState copyWith({
    QuestionData? selectedQuestion,
    SurveyData? surveyData,
  }) {
    return EditQuestionBuilderState(
      selectedQuestion: selectedQuestion ?? this.selectedQuestion,
      surveyData: surveyData ?? this.surveyData,
    );
  }
}

class EditCommonThemeBuilderState extends BuilderState {
  @override
  List<Object?> get props => [surveyData];

  const EditCommonThemeBuilderState({required SurveyData surveyData})
      : super(surveyData);

  @override
  EditCommonThemeBuilderState copyWith({SurveyData? surveyData}) {
    return EditCommonThemeBuilderState(
      surveyData: surveyData ?? this.surveyData,
    );
  }
}
