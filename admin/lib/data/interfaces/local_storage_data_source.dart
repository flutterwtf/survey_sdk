import 'package:survey_core/survey_core.dart';

abstract class LocalStorageDataSource {
  Future<SurveyData?> surveyData();
}
