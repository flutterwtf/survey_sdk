import 'package:survey_sdk/src/data/mappers/actions/action_mapper.dart';
import 'package:survey_sdk/src/domain/entities/actions/finish_survey_action.dart';

abstract final class _Fields {
  static const String type = 'type';
}

final class FinishSurveyActionMapper
    implements ActionMapper<FinishSurveyAction> {
  @override
  Map<String, dynamic> toJson(FinishSurveyAction data) {
    return {
      _Fields.type: data.type,
    };
  }

  @override
  FinishSurveyAction fromJson(Map<String, dynamic> json) {
    return const FinishSurveyAction();
  }
}
