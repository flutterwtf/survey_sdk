import 'package:survey_core/survey_core.dart';

abstract class LocalStorageDataRepository {
  Future<SurveyData?> surveyData();
}
