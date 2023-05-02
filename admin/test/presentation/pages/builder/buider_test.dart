import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mockito/mockito.dart';
import 'package:survey_admin/data/data_sources/interfaces/filesystem_data_source.dart';
import 'package:survey_admin/data/data_sources/interfaces/session_storage_data_source.dart';
import 'package:survey_admin/data/data_sources/web/web_filesystem_data_source_impl.dart';
import 'package:survey_admin/data/data_sources/web/web_session_storage_data_source.dart';
import 'package:survey_admin/data/repositories/file_system_repository_impl.dart';
import 'package:survey_admin/data/repositories/session_storage_repository_impl.dart';
import 'package:survey_admin/domain/repository_interfaces/file_system_repository.dart.dart';
import 'package:survey_admin/domain/repository_interfaces/session_storage_repository.dart';
import 'package:survey_admin/presentation/pages/builder/builder_cubit.dart';
import 'package:survey_admin/presentation/pages/builder/builder_page.dart';
import 'package:survey_admin/presentation/pages/new_question_page/new_question_cubit.dart';

import '../../widgets/app_tester.dart';

//ignore: prefer-match-file-name
class MockNavigatorObserver extends Mock implements NavigatorObserver {}

void main() {
  group('Test Builder Page', () {
    final getIt = GetIt.instance;

    final mockObserver = MockNavigatorObserver();
    final page = AppTester(
      navigatorObservers: [mockObserver],
      child: Builder(
        builder: (context) {
          _inject(getIt);
          return const BuilderPage();
        },
      ),
    );

    testWidgets('Load widgets', (tester) async {
      tester.binding.platformDispatcher.textScaleFactorTestValue = 0.5;
      await tester.pumpWidget(page);
      await tester.pumpAndSettle();
      expect(find.text('Create'), findsOneWidget);
      expect(find.text('Preview'), findsOneWidget);
      expect(find.text('IMPORT'), findsOneWidget);
      expect(find.text('EXPORT'), findsOneWidget);
      expect(find.text('Survey'), findsOneWidget);
      expect(find.text('Common'), findsOneWidget);
      expect(find.text('Content'), findsOneWidget);
      expect(find.text('Intro'), findsNWidgets(2));
      expect(find.text('Input'), findsOneWidget);
      expect(find.text('Choice'), findsOneWidget);
      expect(find.text('NEXT'), findsOneWidget);
      expect(find.text('Common'), findsOneWidget);
      expect(find.text('Content'), findsOneWidget);
      expect(find.text('Fill'), findsOneWidget);
      expect(find.text('Title'), findsOneWidget);
      expect(find.text('Subtitle'), findsOneWidget);
      expect(find.text('Button'), findsOneWidget);
      tester.binding.platformDispatcher.clearTextScaleFactorTestValue();
    });

    testWidgets('Click to export button', (tester) async {
      tester.binding.platformDispatcher.textScaleFactorTestValue = 0.5;
      await tester.pumpWidget(page);

      await tester.tap(find.text('EXPORT'));
      await tester.pumpAndSettle();

      expect(find.text('COPY'), findsOneWidget);
      expect(find.text('DOWNLOAD'), findsOneWidget);
      expect(find.byType(Image), findsOneWidget);

      tester.binding.platformDispatcher.clearTextScaleFactorTestValue();
    });

    testWidgets('Select `Input` question', (tester) async {
      tester.binding.platformDispatcher.textScaleFactorTestValue = 0.5;
      await tester.pumpWidget(page);

      await tester.tap(find.text('Input'));
      await tester.pumpAndSettle();
      expect(find.text('Common'), findsOneWidget);
      expect(find.text('Content'), findsOneWidget);
      expect(find.text('Input'), findsNWidgets(3));

      tester.binding.platformDispatcher.clearTextScaleFactorTestValue();
    });

    testWidgets('Switch tabs', (tester) async {
      tester.binding.platformDispatcher.textScaleFactorTestValue = 0.5;

      await tester.pumpWidget(page);

      await tester.tap(find.text('Content'));
      await tester.pumpAndSettle();

      expect(find.text('Title'), findsOneWidget);
      expect(find.text('Subtitle'), findsOneWidget);
      expect(find.text('Primary button'), findsOneWidget);
      expect(find.text('Secondary button'), findsOneWidget);

      tester.binding.platformDispatcher.clearTextScaleFactorTestValue();
    });
  });
}

void _inject(GetIt getIt) {
  getIt
    ..reset()
    ..registerFactory<FilesystemDataSource>(
      WebFilesystemDataSourceImpl.new,
    )
    ..registerFactory<SessionStorageDataSource>(
      WebSessionStorageDataSource.new,
    )
    ..registerSingleton<FileSystemRepository>(
      FileSystemRepositoryImpl(getIt.get()),
    )
    ..registerSingleton<SessionStorageRepository>(
      SessionStorageRepositoryImpl(getIt.get()),
    )
    ..registerFactory<NewQuestionCubit>(NewQuestionCubit.new)
    ..registerFactory<BuilderCubit>(
      () => BuilderCubit(
        getIt.get(),
        getIt.get(),
      ),
    );
}
