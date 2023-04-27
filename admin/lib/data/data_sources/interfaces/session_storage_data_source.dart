import 'package:survey_client/survey_client.dart';

abstract class SessionStorageDataSource {
  void saveSurveyData(SurveyData surveyData);

  SurveyData? getSurveyData();
}
