import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:survey_admin/data/data_sources/interfaces/filesystem_data_source.dart';
import 'package:survey_admin/data/data_sources/interfaces/session_storage_data_source.dart';
import 'package:survey_admin/data/data_sources/web/web_filesystem_data_source_impl.dart';
import 'package:survey_admin/data/data_sources/web/web_session_storage_data_source.dart';
import 'package:survey_admin/data/repositories/file_system_repository_impl.dart';
import 'package:survey_admin/data/repositories/session_storage_repository_impl.dart';
import 'package:survey_admin/domain/repository_interfaces/file_system_repository.dart.dart';
import 'package:survey_admin/domain/repository_interfaces/session_storage_repository.dart';
import 'package:survey_admin/presentation/pages/builder/builder_cubit.dart';
import 'package:survey_admin/presentation/utils/common_data.dart';

//ignore_for_file: prefer-static-class
GetIt get i => GetIt.instance;

void initInjector() {
  kIsWeb ? _initWebDataSources() : _initMobileDataSources();
  _initRepositories();
  _initCubits();
}

void _initWebDataSources() {
  i
    ..registerFactory<FilesystemDataSource>(
      WebFilesystemDataSourceImpl.new,
    )
    ..registerFactory<SessionStorageDataSource>(
      WebSessionStorageDataSource.new,
    );
}

Future<void> _initMobileDataSources() async {
  throw UnimplementedError();
}

void _initRepositories() {
  i
    ..registerSingleton<FileSystemRepository>(
      FileSystemRepositoryImpl(i.get()),
    )
    ..registerSingleton<SessionStorageRepository>(
      SessionStorageRepositoryImpl(i.get()),
    );
}

void _initCubits() {
  i.registerFactory<BuilderCubit>(() => BuilderCubit(i.get(), i.get()));
}

void initCommonData(BuildContext context) {
  i.registerFactory<CommonData>(() => CommonData(context));
}
