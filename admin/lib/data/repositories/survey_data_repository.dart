import 'package:survey_admin/data/interfaces/filesystem_data_source.dart';
import 'package:survey_admin/data/interfaces/session_storage_data_source.dart';
import 'package:survey_admin/domain/repository_interfaces/survey_data_repository.dart';
import 'package:survey_core/survey_core.dart';

class SurveyDataRepositoryImpl implements SurveyDataRepository {
  final SessionStorageDataSource _sessionStorageDataSource;
  final FileSystemDataSource _fileSystemDataSource;

  SurveyDataRepositoryImpl(
    this._fileSystemDataSource,
    this._sessionStorageDataSource,
  );

  @override
  void downloadSurveyData(Map<String, dynamic> exportJson) =>
      _fileSystemDataSource.downloadSurveyData(exportJson);

  @override
  SurveyData? getSurveyData() => _sessionStorageDataSource.getSurveyData();

  @override
  void saveSurveyData(SurveyData surveyData) =>
      _sessionStorageDataSource.saveSurveyData(surveyData);
}
