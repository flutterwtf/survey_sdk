import 'package:survey_core/src/data/data_sources/filesystem_data_source.dart';
import 'package:survey_core/src/data/data_sources/interfaces/filesystem_data_source.dart';
import 'package:survey_core/src/data/repositories/survey_data_repository.dart';
import 'package:survey_core/src/domain/repository_interfaces/survey_data_repository.dart';
import 'package:survey_core/src/presentation/survey/survey_cubit.dart';

class Injector {
  static final Injector _singleton = Injector._internal();

  factory Injector() {
    return _singleton;
  }

  Injector._internal();

  late final FilesystemDataSource _filesystemDataSource;

  late final SurveyDataRepository _surveyDataRepository;

  late final SurveyCubit surveyCubit;

  void init() {
    _filesystemDataSource = FilesystemDataSourceImpl();

    _surveyDataRepository = SurveyDataRepositoryImpl(_filesystemDataSource);

    surveyCubit = SurveyCubit(_surveyDataRepository);
  }
}
