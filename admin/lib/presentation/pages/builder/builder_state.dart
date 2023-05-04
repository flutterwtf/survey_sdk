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
  final bool isEditMode;

  @override
  List<Object?> get props => [selectedIndex, isEditMode, surveyData];

  const EditQuestionBuilderState({
    required super.surveyData,
    required this.selectedIndex,
    this.isEditMode = true,
  });

  @override
  BuilderState copyWith({
    int? selectedIndex,
    bool? isEditMode,
    SurveyData? surveyData,
  }) {
    return EditQuestionBuilderState(
      selectedIndex: selectedIndex ?? this.selectedIndex,
      isEditMode: isEditMode ?? this.isEditMode,
      surveyData: surveyData ?? this.surveyData,
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
