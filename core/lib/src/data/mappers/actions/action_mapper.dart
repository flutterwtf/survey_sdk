import 'package:survey_sdk/src/domain/entities/actions/action.dart';

abstract interface class ActionMapper<T extends Action> {
  Map<String, dynamic> toJson(T data);
  T fromJson(Map<String, dynamic> json);
}
