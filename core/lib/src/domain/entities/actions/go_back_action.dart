import 'package:survey_sdk/src/domain/entities/actions/survey_action.dart';
import 'package:survey_sdk/src/domain/entities/constants/action_types.dart';

final class GoBackAction extends SurveyAction {
  @override
  String get type => ActionTypes.goBackAction;

  @override
  int get hashCode => type.hashCode ^ super.hashCode;

  @override
  List<Object?> get props => [];

  const GoBackAction();

  @override
  bool operator ==(Object other) => runtimeType == other.runtimeType;
}
