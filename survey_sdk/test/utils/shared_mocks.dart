import 'package:mockito/annotations.dart';
import 'package:survey_sdk/src/data/data_sources/interfaces/filesystem_data_source.dart';
import 'package:survey_sdk/src/data/repositories/survey_data_repository_impl.dart';

@GenerateMocks([
  FilesystemDataSource,
  SurveyDataRepositoryImpl,
])
class SharedMocks {}