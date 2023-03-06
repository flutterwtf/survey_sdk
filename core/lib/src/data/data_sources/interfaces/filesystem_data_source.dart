import 'package:survey_core/src/domain/entities/survey_data.dart';

abstract class FilesystemDataSource {
  Future<SurveyData> getSurveyData(String asset);

  SurveyData getSurveyDataFromJson(String json);
}
