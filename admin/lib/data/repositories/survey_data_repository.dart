import 'package:flutter/foundation.dart';
import 'package:survey_admin/data/interfaces/filesystem_data_source.dart';
import 'package:survey_admin/data/mobile_filesystem_data_source.dart';
import 'package:survey_admin/data/web_filesystem_data_source.dart';
import 'package:survey_admin/domain/repository_interfaces/survey_data_repository.dart';

class SurveyDataRepositoryImpl implements SurveyDataRepository {
  //TODO: DI
  final FileSystemDataSource _fileSystemDataSource =
      kIsWeb ? WebFileSystemDataSourceImpl() : MobileFileSystemDataSourceImpl();

  @override
  void downloadSurveyData(Map<String, dynamic> exportJson) {
    _fileSystemDataSource.downloadSurveyData(exportJson);
  }
}
