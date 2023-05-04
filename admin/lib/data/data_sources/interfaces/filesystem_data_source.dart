import 'package:survey_sdk/survey_sdk.dart';

abstract class FilesystemDataSource {
  void downloadSurveyData(Map<String, dynamic> exportJson);

  Future<SurveyData?> importSurveyData();
}
