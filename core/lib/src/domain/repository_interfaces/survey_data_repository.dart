import 'package:survey_core/src/domain/entities/survey_data.dart';

// ignore: one_member_abstracts
abstract class SurveyDataRepository {
  Future<SurveyData> getSurveyData(String asset);
}
