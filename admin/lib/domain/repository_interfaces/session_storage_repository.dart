import 'package:survey_sdk/survey_sdk.dart';

abstract class SessionStorageRepository {
  void saveSurveyData(SurveyData surveyData);

  SurveyData? getSurveyData();
}
