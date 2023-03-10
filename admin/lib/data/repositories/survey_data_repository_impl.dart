import 'package:survey_admin/data/interfaces/filesystem_data_source.dart';
import 'package:survey_admin/domain/repository_interfaces/survey_data_repository.dart';

class SurveyDataRepositoryImpl implements SurveyDataRepository {
  final FileSystemDataSource _fileSystemDataSource;

  SurveyDataRepositoryImpl(this._fileSystemDataSource);

  @override
  void downloadSurveyData(Map<String, dynamic> exportJson) {
    _fileSystemDataSource.downloadSurveyData(exportJson);
  }
}
