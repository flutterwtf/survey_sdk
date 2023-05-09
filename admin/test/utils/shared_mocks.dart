import 'package:mockito/annotations.dart';
import 'package:survey_admin/data/data_sources/interfaces/filesystem_data_source.dart';
import 'package:survey_admin/data/data_sources/interfaces/session_storage_data_source.dart';
import 'package:survey_admin/domain/repository_interfaces/file_system_repository.dart.dart';
import 'package:survey_admin/domain/repository_interfaces/session_storage_repository.dart';
import 'package:survey_sdk/survey_sdk.dart';

@GenerateMocks([
  FilesystemDataSource,
  SessionStorageDataSource,
  FileSystemRepository,
  SessionStorageRepository,
  SurveyData,
])
class SharedMocks {}
