import 'package:survey_client/survey_client.dart';

abstract class FileSystemRepository {
  void downloadSurveyData(Map<String, dynamic> exportJson);

  Future<SurveyData?> importSurveyData();
}
