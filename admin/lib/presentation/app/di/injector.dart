import 'package:get_it/get_it.dart';
import 'package:survey_sdk/data/data_sources/preferences_data_source.dart';
import 'package:survey_sdk/data/repositories/locale_repository.dart';
import 'package:survey_sdk/data/repositories/theme_repository.dart';
import 'package:survey_sdk/domain/data_interfaces/locale_repository.dart';
import 'package:survey_sdk/domain/data_interfaces/theme_repository.dart';
import 'package:survey_sdk/presentation/app/app_cubit.dart';
import 'package:survey_sdk/presentation/pages/builder/builder_cubit.dart';
import 'package:survey_sdk/presentation/pages/new_question_page/new_question_cubit.dart';

GetIt get i => GetIt.instance;

void initInjector() {
  _initDataSources();
  _initRepositories();
  _initCubits();
}

void _initDataSources() {
  i.registerSingleton<PreferencesDataSource>(
    PreferencesDataSourceImpl(),
  );
}

void _initRepositories() {
  i.registerSingleton<LocaleRepository>(
    LocaleRepositoryImpl(i.get()),
  );
  i.registerSingleton<ThemeRepository>(
    ThemeRepositoryImpl(i.get()),
  );
}

void _initCubits() {
  i.registerFactory<AppCubit>(
    () => AppCubit(
      i.get(),
      i.get(),
    ),
  );
  i.registerFactory<BuilderCubit>(
    () => BuilderCubit(),
  );
  i.registerFactory<NewQuestionCubit>(
    () => NewQuestionCubit(),
  );
}
