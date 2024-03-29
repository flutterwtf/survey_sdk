import 'package:equatable/equatable.dart';
import 'package:survey_sdk/src/data/mappers/actions/finish_survey_action/finish_survey_action_mapper.dart';
import 'package:survey_sdk/src/data/mappers/actions/go_back_action/go_back_action_mapper.dart';
import 'package:survey_sdk/src/data/mappers/actions/go_next_action/go_next_action_mapper.dart';
import 'package:survey_sdk/src/data/mappers/actions/go_to_action/go_to_action_mapper.dart';
import 'package:survey_sdk/src/data/mappers/actions/skip_question_action/skip_question_action_mapper.dart';
import 'package:survey_sdk/src/domain/entities/actions/finish_survey_action.dart';
import 'package:survey_sdk/src/domain/entities/actions/go_back_action.dart';
import 'package:survey_sdk/src/domain/entities/actions/go_next_action.dart';
import 'package:survey_sdk/src/domain/entities/actions/go_to_action.dart';
import 'package:survey_sdk/src/domain/entities/actions/skip_question_action.dart';
import 'package:survey_sdk/src/domain/entities/constants/action_types.dart';

abstract final class _Fields {
  static const String type = 'type';
}

abstract class SurveyAction extends Equatable {
  String get type;

  const SurveyAction();

  static Map<String, dynamic> toJson(SurveyAction data) =>
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
        GoNextAction => GoNextActionMapper().toJson(
            data as GoNextAction,
          ),
        GoBackAction => GoBackActionMapper().toJson(
            data as GoBackAction,
          ),
        _ => throw UnimplementedError(),
      };

  static SurveyAction? fromJson(dynamic json) => json == null
      ? null
      : switch ((json as Map<String, dynamic>)[_Fields.type]) {
          ActionTypes.goToAction => GoToActionMapper().fromJson(json),
          ActionTypes.finishSurveyAction => FinishSurveyActionMapper().fromJson(
              json,
            ),
          ActionTypes.skipQuestionAction =>
            SkipQuestionActionMapper().fromJson(json),
          ActionTypes.goNextAction => GoNextActionMapper().fromJson(
              json,
            ),
          ActionTypes.goBackAction => GoBackActionMapper().fromJson(
              json,
            ),
          _ => null,
        };
}
