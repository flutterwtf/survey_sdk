import 'package:survey_core/survey_core.dart';

abstract class FileSystemRepository {
  void downloadSurveyData(Map<String, dynamic> exportJson);

  Future<SurveyData?> importSurveyData();
}
