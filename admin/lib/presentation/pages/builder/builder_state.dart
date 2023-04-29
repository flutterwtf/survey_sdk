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
    required this.selectedIndex,
    required super.surveyData,
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

class ImportSurveyDataBuilderState extends BuilderState {
  final bool? isImported;

  @override
  List<Object?> get props => [surveyData];

  const ImportSurveyDataBuilderState({
    required super.surveyData,
    this.isImported,
  });

  @override
  BuilderState copyWith({
    SurveyData? surveyData,
    bool? isImported,
  }) {
    return ImportSurveyDataBuilderState(
      surveyData: surveyData ?? this.surveyData,
      isImported: isImported ?? this.isImported,
    );
  }
}
