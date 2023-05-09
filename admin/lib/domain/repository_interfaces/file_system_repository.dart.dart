import 'package:survey_sdk/survey_sdk.dart';

abstract class FileSystemRepository {
  void downloadSurveyData(Map<String, dynamic> exportJson);

  Future<SurveyData?> importSurveyData();
}
