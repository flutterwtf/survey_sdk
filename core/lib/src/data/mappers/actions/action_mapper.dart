import 'package:survey_sdk/src/domain/entities/actions/survey_action.dart';

abstract interface class ActionMapper<T extends SurveyAction> {
  Map<String, dynamic> toJson(T data);
  T fromJson(Map<String, dynamic> json);
}
