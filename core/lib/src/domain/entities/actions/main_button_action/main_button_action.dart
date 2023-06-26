import 'package:survey_sdk/src/data/mappers/actions/finish_survey_action/finish_survey_action_mapper.dart';
import 'package:survey_sdk/src/data/mappers/actions/go_to_action/go_to_action_mapper.dart';
import 'package:survey_sdk/src/data/mappers/actions/skip_question_action/skip_question_action_mapper.dart';
import 'package:survey_sdk/src/domain/entities/actions/action.dart';
import 'package:survey_sdk/src/domain/entities/actions/main_button_action/finish_survey_action.dart';
import 'package:survey_sdk/src/domain/entities/actions/main_button_action/go_to_action.dart';
import 'package:survey_sdk/src/domain/entities/actions/main_button_action/skip_question_action.dart';

abstract final class _Fields {
  static const String goToAction = 'goToAction';
  static const String finishSurveyAction = 'finishSurveyAction';
  static const String skipQuestionAction = 'skipQuestionAction';
}

abstract class MainButtonAction extends Action {
  static Map<String, dynamic> toJsonByType(MainButtonAction data) =>
      switch (data.runtimeType) {
        GoToAction => GoToActionMapper().toJson(
            data as GoToAction,
          ),
        FinishSurveyAction => FinishSurveyActionMapper().toJson(
            data as FinishSurveyAction,
          ),
        SkipQuestionAction => SkipQuestionActionMapper().toJson(
            data as SkipQuestionAction,
          ),
        _ => throw UnimplementedError(),
      };

  static MainButtonAction? fromJsonByType(Map<String, dynamic> json) {
    if (json.values.first != null) {
      final jsonActions = json.values.first as Map<String, dynamic>;
      final jsonKey = jsonActions.keys.first;
      final jsonValue = jsonActions.values.first;

      switch (jsonKey) {
        case _Fields.goToAction:
          return GoToActionMapper().fromJson(jsonValue);
        case _Fields.finishSurveyAction:
          return FinishSurveyActionMapper().fromJson(jsonValue);
        case _Fields.skipQuestionAction:
          return SkipQuestionActionMapper().fromJson(jsonValue);
      }
    }

    return null;
  }
}
