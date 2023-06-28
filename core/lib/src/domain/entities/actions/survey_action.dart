import 'package:equatable/equatable.dart';
import 'package:survey_sdk/src/data/mappers/actions/finish_survey_action/finish_survey_action_mapper.dart';
import 'package:survey_sdk/src/data/mappers/actions/go_to_action/go_to_action_mapper.dart';
import 'package:survey_sdk/src/data/mappers/actions/skip_question_action/skip_question_action_mapper.dart';
import 'package:survey_sdk/src/domain/entities/actions/finish_survey_action.dart';
import 'package:survey_sdk/src/domain/entities/actions/go_to_action.dart';
import 'package:survey_sdk/src/domain/entities/actions/skip_question_action.dart';
import 'package:survey_sdk/src/domain/entities/constants/action_types.dart';

abstract final class _Fields {
  static const String type = 'type';
}

abstract class SurveyAction extends Equatable {
  String get type;

  static Map<String, dynamic> toJsonByType(SurveyAction data) =>
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

  static SurveyAction? fromType(dynamic json) => json == null
      ? null
      : switch ((json as Map<String, dynamic>)[_Fields.type]) {
          ActionTypes.goToAction => GoToActionMapper().fromJson(json),
          ActionTypes.finishSurveyAction => FinishSurveyActionMapper().fromJson(
              json,
            ),
          ActionTypes.skipQuestionAction =>
            SkipQuestionActionMapper().fromJson(json),
          _ => null,
        };
}
