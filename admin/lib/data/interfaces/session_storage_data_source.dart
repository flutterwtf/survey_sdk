import 'package:survey_core/survey_core.dart';

abstract class ApiSessionStorageDataSource {
  void saveSurveyData(SurveyData surveyData);

  SurveyData? getSurveyData();
}
