import 'package:survey_core/survey_core.dart';

abstract class SessionStorageRepository {
  void saveSurveyData(SurveyData surveyData);

  SurveyData? getSurveyData();
}
