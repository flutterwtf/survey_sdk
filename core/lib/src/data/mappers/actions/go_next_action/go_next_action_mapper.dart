import 'package:survey_sdk/src/data/mappers/actions/action_mapper.dart';
import 'package:survey_sdk/src/domain/entities/actions/go_next_action.dart';

abstract final class _Fields {
  static const String type = 'type';
}

final class GoNextActionMapper implements ActionMapper<GoNextAction> {
  @override
  Map<String, dynamic> toJson(GoNextAction data) {
    return {
      _Fields.type: data.type,
    };
  }

  @override
  GoNextAction fromJson(Map<String, dynamic> json) {
    return const GoNextAction();
  }
}
