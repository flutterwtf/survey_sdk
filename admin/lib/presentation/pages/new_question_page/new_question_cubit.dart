import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:survey_admin/presentation/pages/new_question_page/new_question_state.dart';
import 'package:survey_admin/presentation/pages/new_question_page/new_question_tabs.dart';
import 'package:survey_sdk/survey_sdk.dart';

class NewQuestionCubit extends Cubit<NewQuestionState> {
  NewQuestionCubit(SurveyData data)
      : super(
          NewQuestionIdleState(data: data),
        );

  void selectTab(NewQuestionTabs tab) => emit(
        state.copyWith(selectedTab: tab),
      );
}
