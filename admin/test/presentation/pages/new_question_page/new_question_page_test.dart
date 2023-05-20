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
import 'package:survey_admin/presentation/pages/new_question_page/new_question_page.dart';
import 'package:survey_admin/presentation/utils/common_data.dart';
import 'package:survey_admin/presentation/widgets/vector_image.dart';

import '../../widgets/app_tester.dart';

//ignore: prefer-match-file-name
class MockNavigatorObserver extends Mock implements NavigatorObserver {}

void main() {
  group('Tests for NewQuestionPage', () {
    final getIt = GetIt.instance;

    final mockObserver = MockNavigatorObserver();
    final page = AppTester(
      navigatorObservers: [mockObserver],
      child: Builder(
        builder: (context) {
          _inject(getIt, context);
          return const NewQuestionPage();
        },
      ),
    );

    testWidgets('Load widget', (tester) async {
      tester.binding.platformDispatcher.textScaleFactorTestValue = 0.5;
      await tester.pumpWidget(page);
      await tester.pumpAndSettle();
      expect(find.text('New screen'), findsOneWidget);
      expect(find.text('ADD'), findsOneWidget);
      expect(find.text('Intro'), findsOneWidget);
      expect(find.text('Choice'), findsOneWidget);
      expect(find.text('Slider'), findsOneWidget);
      expect(find.text('Custom input'), findsOneWidget);
      expect(find.text('Title'), findsNWidgets(2));
      expect(find.text('Common'), findsOneWidget);
      expect(find.text('Content'), findsOneWidget);
      tester.binding.platformDispatcher.clearTextScaleFactorTestValue();
    });

    testWidgets('Close widget', (tester) async {
      await tester.pumpWidget(page);
      await tester.tap(find.byType(VectorImage).last);
      await tester.pumpAndSettle();
      expect(find.text('New screen'), findsNothing);
    });

    testWidgets('Move on tab', (tester) async {
      await tester.pumpWidget(page);
      expect(find.text('Title'), findsNWidgets(2));

      await tester.tap(find.text('Choice'));
      await tester.pump();
      expect(find.text('Radio button'), findsNWidgets(2));
      expect(find.text('Check box'), findsOneWidget);

      await tester.tap(find.text('Slider'));
      await tester.pump();
      expect(find.text('Slider'), findsNWidgets(3));

      await tester.tap(find.text('Custom input'));
      await tester.pump();
      expect(find.text('Single-line input'), findsOneWidget);
      expect(find.text('Multi-line input'), findsOneWidget);

      await tester.tap(find.text('Intro'));
      await tester.pump();
      expect(find.text('Title'), findsNWidgets(2));
    });

    testWidgets('Click ADD', (tester) async {
      await tester.pumpWidget(page);
      await tester.pumpAndSettle();
      await tester.tap(find.widgetWithText(GestureDetector, 'ADD'));
      await tester.pumpAndSettle();
      expect(find.text('ADD'), findsNothing);
    });
  });
}

Future<void> _inject(GetIt getIt, BuildContext context) async {
  if (getIt.isRegistered<CommonData>()) await getIt.reset();

  getIt
    ..registerSingleton(
      CommonData(context),
    )
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
    ..registerSingleton<BuilderCubit>(
      BuilderCubit(
        getIt.get(),
        getIt.get(),
      ),
    );
}
