import 'package:survey_sdk/src/data/mappers/actions/action_mapper.dart';
import 'package:survey_sdk/src/domain/entities/actions/go_to_action.dart';

abstract final class _Fields {
  static const String type = 'type';
  static const String questionIndex = 'questionIndex';
}

final class GoToActionMapper implements ActionMapper<GoToAction> {
  @override
  Map<String, dynamic> toJson(GoToAction data) {
    return {
      _Fields.type: data.type,
      _Fields.questionIndex: data.questionIndex,
    };
  }

  @override
  GoToAction fromJson(Map<String, dynamic> json) {
    return GoToAction(
      questionIndex: json[_Fields.questionIndex],
    );
  }
}
