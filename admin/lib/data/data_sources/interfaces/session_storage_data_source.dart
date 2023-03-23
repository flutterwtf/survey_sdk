import 'package:survey_core/survey_core.dart';

abstract class SessionStorageDataSource {
  void saveSurveyData(SurveyData surveyData);

  SurveyData? getSurveyData();
}
