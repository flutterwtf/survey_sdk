import 'package:survey_sdk/src/domain/entities/actions/survey_action.dart';
import 'package:survey_sdk/src/domain/entities/constants/action_types.dart';

class GoToAction extends SurveyAction {
  final int questionIndex;

  @override
  int get hashCode => questionIndex ^ type.hashCode ^ super.hashCode;

  @override
  String get type => ActionTypes.goToAction;

  @override
  List<Object?> get props => [
        questionIndex,
      ];

  GoToAction({required this.questionIndex});

  @override
  bool operator ==(Object other) => other is GoToAction &&
      questionIndex == other.questionIndex;
}
