import 'package:survey_core/survey_core.dart';

abstract class FileSystemDataSource {
  void downloadSurveyData(Map<String, dynamic> exportJson);

  Future<SurveyData?> importSurveyData();
}
