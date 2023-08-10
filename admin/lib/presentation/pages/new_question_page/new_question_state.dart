import 'package:equatable/equatable.dart';
import 'package:survey_admin/presentation/pages/new_question_page/new_question_tabs.dart';
import 'package:survey_sdk/survey_sdk.dart';

abstract class NewQuestionState extends Equatable {
  final NewQuestionTabs selectedTab;
  final SurveyData data;

  const NewQuestionState({
    required this.data,
    this.selectedTab = NewQuestionTabs.info,
  });

  NewQuestionState copyWith({
    NewQuestionTabs? selectedTab,
    SurveyData? data,
  });
}

class NewQuestionIdleState extends NewQuestionState {
  @override
  List<Object?> get props => [
        selectedTab,
        data,
      ];

  const NewQuestionIdleState({
    required super.data,
    super.selectedTab = NewQuestionTabs.info,
  });

  @override
  NewQuestionIdleState copyWith({
    NewQuestionTabs? selectedTab,
    SurveyData? data,
  }) =>
      NewQuestionIdleState(
        data: data ?? super.data,
        selectedTab: selectedTab ?? super.selectedTab,
      );
}
