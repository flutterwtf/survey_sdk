import 'package:survey_core/survey_core.dart';

abstract class FileSystemDataSource {
  void downloadSurveyData(Object exportJson);
  Future<SurveyData?> importSurveyData();
}
