import 'package:get_it/get_it.dart';
import 'package:survey_admin/data/data_sources/filesystem_data_source.dart';
import 'package:survey_admin/data/data_sources/interfaces/filesystem_data_source.dart';
import 'package:survey_admin/data/repositories/survey_data_repository.dart';
import 'package:survey_admin/domain/repository_interfaces/survey_data_repository.dart';
import 'package:survey_admin/presentation/app/app_cubit.dart';
import 'package:survey_admin/presentation/pages/builder/builder_cubit.dart';
import 'package:survey_admin/presentation/pages/new_question_page/new_question_cubit.dart';

GetIt get i => GetIt.instance;

Future<void> initInjector() async {
  _initDataSources();
  _initRepositories();
  _initCubits();
}

Future<void> _initDataSources() async {
  i.registerSingleton<FilesystemDataSource>(
    FilesystemDataSourceImpl(),
  );
}

void _initCubits() {
  i
    ..registerFactory<AppCubit>(AppCubit.new)
    ..registerFactory<BuilderCubit>(BuilderCubit.new)
    ..registerFactory<NewQuestionCubit>(NewQuestionCubit.new);
}

void _initRepositories() {
  i.registerSingleton<SurveyDataRepository>(
    SurveyDataRepositoryImpl(i.get<FilesystemDataSource>()),
  );
}
