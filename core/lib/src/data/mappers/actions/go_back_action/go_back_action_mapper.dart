import 'package:survey_sdk/src/data/mappers/actions/action_mapper.dart';
import 'package:survey_sdk/src/domain/entities/actions/go_back_action.dart';

abstract final class _Fields {
  static const String type = 'type';
}

final class GoBackActionMapper implements ActionMapper<GoBackAction> {
  @override
  Map<String, dynamic> toJson(GoBackAction data) {
    return {
      _Fields.type: data.type,
    };
  }

  @override
  GoBackAction fromJson(Map<String, dynamic> json) {
    return const GoBackAction();
  }
}
