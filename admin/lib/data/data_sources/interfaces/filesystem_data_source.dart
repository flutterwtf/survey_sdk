import 'package:survey_client/survey_client.dart';

abstract class FilesystemDataSource {
  void downloadSurveyData(Map<String, dynamic> exportJson);

  Future<SurveyData?> importSurveyData();
}
