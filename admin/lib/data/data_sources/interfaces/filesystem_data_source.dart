import 'package:survey_core/survey_core.dart';

abstract class FilesystemDataSource {
  void downloadSurveyData(Map<String, dynamic> exportJson);

  Future<SurveyData?> importSurveyData();
}
