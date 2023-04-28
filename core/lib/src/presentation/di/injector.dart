import 'package:survey_core/src/data/data_sources/filesystem_data_source_impl.dart';
import 'package:survey_core/src/data/data_sources/interfaces/filesystem_data_source.dart';
import 'package:survey_core/src/data/repositories/survey_data_repository_impl.dart';
import 'package:survey_core/src/domain/repository_interfaces/survey_data_repository.dart';
import 'package:survey_core/src/presentation/survey/survey_cubit.dart';

class Injector {
  late SurveyCubit surveyCubit;
  static final Injector _singleton = Injector._internal();
  late FilesystemDataSource _filesystemDataSource;
  late SurveyDataRepository _surveyDataRepository;

  factory Injector() {
    return _singleton;
  }

  Injector._internal();

  void init() {
    _filesystemDataSource = FilesystemDataSourceImpl();

    _surveyDataRepository = SurveyDataRepositoryImpl(_filesystemDataSource);

    surveyCubit = SurveyCubit(_surveyDataRepository);
  }
}
