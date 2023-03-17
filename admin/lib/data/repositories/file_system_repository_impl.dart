import 'package:survey_admin/data/interfaces/filesystem_data_source.dart';
import 'package:survey_admin/domain/repository_interfaces/file_system_repository.dart.dart';
import 'package:survey_core/survey_core.dart';

class FileSystemRepositoryImpl extends FileSystemRepository {
  final FileSystemDataSource _fileSystemDataSource;

  FileSystemRepositoryImpl(this._fileSystemDataSource);

  @override
  Future<SurveyData?> importSurveyData() =>
      _fileSystemDataSource.importSurveyData();

  @override
  void downloadSurveyData(Map<String, dynamic> exportJson) =>
      _fileSystemDataSource.downloadSurveyData(exportJson);

}
