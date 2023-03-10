import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:survey_admin/data/data_sources/web_filesystem_data_source.dart';
import 'package:survey_admin/data/interfaces/filesystem_data_source.dart';
import 'package:survey_admin/data/repositories/survey_data_repository_impl.dart';
import 'package:survey_admin/domain/repository_interfaces/survey_data_repository.dart';
import 'package:survey_admin/presentation/app/app_cubit.dart';
import 'package:survey_admin/presentation/pages/builder/builder_cubit.dart';
import 'package:survey_admin/presentation/pages/new_question_page/new_question_cubit.dart';

GetIt get i => GetIt.instance;

Future<void> initInjector() async {
  kIsWeb ? _initWebDataSources() : _initMobileDataSources();
  _initRepositories();
  _initCubits();
}

Future<void> _initWebDataSources() async {
  i.registerSingleton<FileSystemDataSource>(WebFileSystemDataSourceImpl());
}

Future<void> _initMobileDataSources() async {
  throw UnimplementedError();
}

void _initRepositories() {
  i.registerSingleton<SurveyDataRepository>(
    SurveyDataRepositoryImpl(
      kIsWeb ? i.get() : throw UnimplementedError(),
    ),
  );
}

void _initCubits() {
  i
    ..registerFactory<AppCubit>(AppCubit.new)
    ..registerFactory<NewQuestionCubit>(NewQuestionCubit.new)
    ..registerFactory<BuilderCubit>(
      () => BuilderCubit(
        i.get(),
      ),
    );
}
