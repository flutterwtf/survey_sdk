import 'package:survey_sdk/src/data/data_sources/interfaces/filesystem_data_source.dart';
import 'package:survey_sdk/src/domain/entities/survey_data.dart';
import 'package:survey_sdk/src/domain/repository_interfaces/survey_data_repository.dart';

class SurveyDataRepositoryImpl implements SurveyDataRepository {
  final FilesystemDataSource _fileSystemDataSource;

  SurveyDataRepositoryImpl(this._fileSystemDataSource);

  @override
  Future<(SurveyData?, List<String>)> getSurveyData(String filePath) =>
      _fileSystemDataSource.getSurveyData(filePath);
}
