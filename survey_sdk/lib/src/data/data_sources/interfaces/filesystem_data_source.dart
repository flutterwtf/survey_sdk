import 'package:survey_sdk/src/domain/entities/survey_data.dart';

// ignore: one_member_abstracts
abstract class FilesystemDataSource {
  Future<SurveyData> getSurveyData(String filePath);
}
