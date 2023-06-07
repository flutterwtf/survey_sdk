import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
import 'package:survey_admin/presentation/app/di/injector.dart';
import 'package:survey_admin/presentation/pages/builder/builder_cubit.dart';
import 'package:survey_admin/presentation/pages/builder/builder_page.dart';

import '../../widgets/app_tester.dart';

//ignore: prefer-match-file-name
class MockNavigatorObserver extends Mock implements NavigatorObserver {}

void main() {
  group('Test Builder Page', () {
    final getIt = GetIt.instance;

    final mockObserver = MockNavigatorObserver();
    final page = AppTester(
      navigatorObservers: [mockObserver],
      child: BlocProvider(
        create: (context) => i.get<BuilderCubit>(),
        child: Builder(
          builder: (_) {
            _inject(getIt);
            return const BuilderPage();
          },
        ),
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
      expect(find.text('Intro'), findsNWidgets(3));
      expect(find.text('Input'), findsOneWidget);
      expect(find.text('Choice'), findsOneWidget);
      expect(find.text('NEXT'), findsNWidgets(2));
      expect(find.text('Common'), findsOneWidget);
      expect(find.text('Content'), findsOneWidget);
      expect(find.text('Title'), findsOneWidget);
      expect(find.text('Subtitle'), findsOneWidget);
      expect(find.text('Primary button'), findsOneWidget);
      expect(find.text('Secondary button'), findsOneWidget);
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
      expect(find.text('Input'), findsNWidgets(4));

      tester.binding.platformDispatcher.clearTextScaleFactorTestValue();
    });

    testWidgets('Select `Choice` question', (tester) async {
      tester.binding.platformDispatcher.textScaleFactorTestValue = 0.5;
      await tester.pumpWidget(page);

      await tester.tap(find.text('Choice'));
      await tester.pumpAndSettle();
      expect(find.text('Choice'), findsNWidgets(3));
      expect(find.text('Common'), findsOneWidget);
      expect(find.text('Content'), findsOneWidget);
      expect(find.text('Radio button'), findsOneWidget);

      tester.binding.platformDispatcher.clearTextScaleFactorTestValue();
    });

    testWidgets('Select `Slider` question', (tester) async {
      tester.binding.platformDispatcher.textScaleFactorTestValue = 0.5;
      await tester.pumpWidget(page);

      await tester.tap(find.text('Slider'));
      await tester.pumpAndSettle();
      expect(find.text('Slider'), findsNWidgets(4));
      expect(find.text('Common'), findsOneWidget);
      expect(find.text('Content'), findsOneWidget);

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

    testWidgets('Delete survey', (tester) async {
      tester.binding.platformDispatcher.textScaleFactorTestValue = 0.5;

      await tester.pumpWidget(page);

      await tester.longPress(find.text('Intro').first);
      await tester.tap(find.text('Delete'));
      await tester.pumpAndSettle();

      expect(find.text('Intro'), findsNothing);

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
    ..registerFactory<BuilderCubit>(
      () => BuilderCubit(
        getIt.get(),
        getIt.get(),
      ),
    );
}
