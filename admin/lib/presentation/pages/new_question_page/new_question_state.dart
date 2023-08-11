import 'package:equatable/equatable.dart';
import 'package:survey_admin/presentation/pages/new_question_page/new_question_tabs.dart';
import 'package:survey_sdk/survey_sdk.dart';

class NewQuestionState extends Equatable {
  final NewQuestionTabs selectedTab;
  final SurveyData data;

  const NewQuestionState({
    required this.data,
    this.selectedTab = NewQuestionTabs.info,
  });

  @override
  List<Object?> get props => [
    selectedTab,
    data,
  ];

  NewQuestionState copyWith({
    NewQuestionTabs? selectedTab,
    SurveyData? data,
  }) =>
      NewQuestionState(
        data: data ?? this.data,
        selectedTab: selectedTab ?? this.selectedTab,
      );
}
