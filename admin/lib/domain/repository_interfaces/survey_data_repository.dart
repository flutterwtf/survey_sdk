import 'package:survey_core/survey_core.dart';

abstract class SurveyDataRepository {
  void downloadSurveyData(Map<String, dynamic> exportJson);

  void saveSurveyData(SurveyData surveyData);

  SurveyData? getSurveyData();
}
