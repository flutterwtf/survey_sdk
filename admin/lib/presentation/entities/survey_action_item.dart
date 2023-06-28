import 'package:survey_sdk/survey_sdk.dart';

final class SurveyActionItem {
  final String actionLabel;
  final SurveyAction action;

  SurveyActionItem({
    required this.actionLabel,
    required this.action,
  });
}
