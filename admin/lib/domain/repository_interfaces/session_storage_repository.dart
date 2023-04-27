import 'package:survey_client/survey_client.dart';

abstract class SessionStorageRepository {
  void saveSurveyData(SurveyData surveyData);

  SurveyData? getSurveyData();
}
