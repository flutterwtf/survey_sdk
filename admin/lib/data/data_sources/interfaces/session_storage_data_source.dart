import 'package:survey_sdk/survey_sdk.dart';

abstract class SessionStorageDataSource {
  void saveSurveyData(SurveyData surveyData);

  SurveyData? getSurveyData();
}
