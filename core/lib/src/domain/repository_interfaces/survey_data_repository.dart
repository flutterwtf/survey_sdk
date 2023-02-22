import 'package:survey_core/src/domain/entities/survey_data.dart';

abstract class SurveyDataRepository {
  Future<SurveyData> getSurveyData(String asset);
}