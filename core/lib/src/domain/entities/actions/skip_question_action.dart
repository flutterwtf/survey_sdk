import 'package:survey_sdk/src/domain/entities/actions/survey_action.dart';
import 'package:survey_sdk/src/domain/entities/constants/action_types.dart';

final class SkipQuestionAction extends SurveyAction {
  @override
  String get type => ActionTypes.skipQuestionAction;

  @override
  List<Object?> get props => [];
}
