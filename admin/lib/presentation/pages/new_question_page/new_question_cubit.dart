import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:survey_admin/presentation/pages/new_question_page/new_question_state.dart';
import 'package:survey_admin/presentation/pages/new_question_page/new_question_tabs.dart';
import 'package:survey_sdk/survey_sdk.dart';

class NewQuestionCubit extends Cubit<NewQuestionState> {
  NewQuestionCubit(SurveyData data)
      : super(
          NewQuestionState(data: data),
        );

  void selectTab(NewQuestionTabs tab) => emit(
        state.copyWith(selectedTab: tab),
      );

  void updateData(QuestionData data) {
    var surveyData = state.data;
    final common = surveyData.commonTheme;
    switch (data.type) {
      case QuestionTypes.choice:
        surveyData = surveyData.copyWith(
          commonTheme: common.copyWith(choice: data as ChoiceQuestionData),
        );
      case QuestionTypes.input:
        surveyData = surveyData.copyWith(
          commonTheme: common.copyWith(input: data as InputQuestionData),
        );

      case QuestionTypes.info:
        surveyData = surveyData.copyWith(
          commonTheme: common.copyWith(info: data as InfoQuestionData),
        );
      case QuestionTypes.slider:
        surveyData = surveyData.copyWith(
          commonTheme: common.copyWith(slider: data as SliderQuestionData),
        );
    }
    emit(state.copyWith(data: surveyData));
  }
}
