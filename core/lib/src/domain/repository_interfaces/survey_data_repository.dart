import 'package:survey_sdk/src/domain/entities/survey_data.dart';

// ignore: one_member_abstracts
abstract class SurveyDataRepository {
  Future<(SurveyData?, List<String>)> getSurveyData(String filePath);
}
