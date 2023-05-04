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
    required this.selectedIndex,
    required super.surveyData,
    this.isEditMode = true,
  });

  @override
  BuilderState copyWith({
    int? selectedIndex,
    bool? isPreviewMode,
    SurveyData? surveyData,
  }) {
    return EditQuestionBuilderState(
      selectedIndex: selectedIndex ?? this.selectedIndex,
      isEditMode: isPreviewMode ?? this.isEditMode,
      surveyData: surveyData ?? this.surveyData,
    );
  }
}

class PreviewQuestionBuilderState extends BuilderState {
  @override
  List<Object?> get props => [surveyData];

  const PreviewQuestionBuilderState({
    required super.surveyData,
  });

  @override
  BuilderState copyWith({
    SurveyData? surveyData,
  }) {
    return PreviewQuestionBuilderState(
      surveyData: surveyData ?? this.surveyData,
    );
  }

  
}