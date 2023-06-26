import 'package:survey_sdk/src/data/mappers/actions/action_mapper.dart';
import 'package:survey_sdk/src/domain/entities/actions/main_button_action/skip_question_action.dart';

abstract final class _Fields {
  static const String skipQuestionAction = 'skipQuestionAction';
}

final class SkipQuestionActionMapper
    implements ActionMapper<SkipQuestionAction> {
  @override
  Map<String, dynamic> toJson(SkipQuestionAction data) {
    return {
      _Fields.skipQuestionAction: {},
    };
  }

  @override
  SkipQuestionAction fromJson(Map<String, dynamic> json) {
    return SkipQuestionAction();
  }
}
