import 'package:survey_sdk/src/data/mappers/actions/action_mapper.dart';
import 'package:survey_sdk/src/domain/entities/actions/main_button_action/go_to_action.dart';

abstract final class _Fields {
  static const String goToAction = 'goToAction';
  static const String questionIndex = 'questionIndex';
}

final class GoToActionMapper implements ActionMapper<GoToAction> {
  @override
  Map<String, dynamic> toJson(GoToAction data) {
    return {
      _Fields.goToAction: {
        _Fields.questionIndex: data.questionIndex,
      },
    };
  }

  @override
  GoToAction fromJson(Map<String, dynamic> json) {
    return GoToAction(
      questionIndex: json[_Fields.questionIndex],
    );
  }
}
