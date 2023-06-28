import 'package:survey_sdk/src/domain/entities/actions/survey_action.dart';
import 'package:survey_sdk/src/domain/entities/constants/action_types.dart';

class FinishSurveyAction extends SurveyAction {

  @override
  String get type => ActionTypes.finishSurveyAction;

  @override
  List<Object?> get props => [];
}
