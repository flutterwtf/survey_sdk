import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:survey_admin/data/data_sources/filesystem_data_source_impl.dart';
import 'package:survey_admin/data/data_sources/interfaces/filesystem_data_source.dart';
import 'package:survey_admin/data/data_sources/session_storage_data_source_impl.dart';
import 'package:survey_admin/data/interfaces/session_storage_data_source.dart';
import 'package:survey_admin/data/repositories/file_system_repository_impl.dart';
import 'package:survey_admin/data/repositories/session_storage_repository_impl.dart';
import 'package:survey_admin/domain/repository_interfaces/file_system_repository.dart.dart';
import 'package:survey_admin/domain/repository_interfaces/session_storage_repository.dart';
import 'package:survey_admin/presentation/app/app_cubit.dart';
import 'package:survey_admin/presentation/pages/builder/builder_cubit.dart';
import 'package:survey_admin/presentation/pages/new_question_page/new_question_cubit.dart';

GetIt get i => GetIt.instance;

void initInjector() {
  _initDataSources();
  _initRepositories();
  _initCubits();
}


void _initDataSources() {
  i.registerFactory<FilesystemDataSource>(FileSystemDataSourceImpl.new);
  if (kIsWeb) {
    i.registerFactory<SessionStorageDataSource>(
      SessionStorageDataSourceImpl.new,
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
  i
    ..registerFactory<SessionStorageRepository>(
      () => SessionStorageRepositoryImpl(
        i.get<SessionStorageDataSource>(),
      ),
    )
    ..registerFactory<FileSystemRepository>(
      () => FileSystemRepositoryImpl(
        i.get<FilesystemDataSource>(),
      ),
    );
}
