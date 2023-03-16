import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:survey_admin/data/data_sources/local_storage_data_source.dart';
import 'package:survey_admin/data/data_sources/session_storage_data_source.dart';
import 'package:survey_admin/data/interfaces/local_storage_data_source.dart';
import 'package:survey_admin/data/repositories/local_storage_data_repository.dart';
import 'package:survey_admin/domain/repository_interfaces/local_storage_data_repository.dart';
import 'package:survey_admin/data/interfaces/session_storage_data_source.dart';
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

void _initDataSources() {
  i.registerFactory<LocalStorageDataSource>(LocalStorageDataSourceImpl.new);
  if (kIsWeb) {
    i.registerFactory<SessionStorageDataSource>(
      WebSessionStorageDataSource.new,
    );
  }
}

void _initCubits() {
  i
    ..registerFactory<AppCubit>(AppCubit.new)
    ..registerFactory<BuilderCubit>(() => BuilderCubit(i.get(), i.get()))
    ..registerFactory<NewQuestionCubit>(NewQuestionCubit.new);
}

void _initRepositories() {
  i.registerFactory<LocalStorageDataRepository>(
    () => LocalStorageDataRepositoryImpl(i.get()),
  );
  i.registerFactory<SurveyDataRepository>(
    () => SurveyDataRepositoryImpl(
      i.get<SessionStorageDataSource>(),
    ),
  );
}
