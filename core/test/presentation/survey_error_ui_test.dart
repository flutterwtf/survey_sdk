import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:survey_sdk/src/data/data_sources/filesystem_data_source_impl.dart';
import 'package:survey_sdk/src/data/repositories/survey_data_repository_impl.dart';
import 'package:survey_sdk/src/presentation/localization/survey_localizations_ext.dart';
import 'package:survey_sdk/src/presentation/survey/survey_cubit.dart';
import 'package:survey_sdk/src/presentation/survey/survey_state.dart';
import 'package:survey_sdk/src/presentation/survey_error/survey_error.dart';
import 'package:survey_sdk/src/presentation/utils/survey_error_state.dart';

import 'widget/app_tester.dart';

// ignore_for_file: unused_element

// ignore: prefer-match-file-name
class MockSurveyDataRepository extends Mock
    implements SurveyDataRepositoryImpl {}

late String _surveyLoadError;
late String _showDetails;
late String _closeDetails;
late String _damagedJson;
late String _next;
late String _textField;
late String _skip;

void _initializeLocalizations(BuildContext context) {
  _surveyLoadError = context.localization.surveyLoadError;
  _showDetails = context.localization.showErrorDetails;
  _closeDetails = context.localization.hideErrorDetails;
  _damagedJson = context.localization.damagedJson;
  _next = context.localization.next;
  _textField = context.localization.textField;
  _skip = context.localization.skip;
}

void main() async {
  const filePathToIncorrectJson = 'test/assets/test_survey_incorrect_data.json';

  final mockSurveyDataRepository = MockSurveyDataRepository();

  final surveyDataSource = FilesystemDataSourceImpl();

  final dataWithIncorrectJson = await surveyDataSource.getSurveyData(
    filePathToIncorrectJson,
  );
  final dataWithIncorrectPath = await surveyDataSource.getSurveyData(
    'incorrect_path',
  );
  final errorsWithIncorrectJson = dataWithIncorrectJson.$2;
  final errorsWithIncorrectPath = dataWithIncorrectPath.$2;

  group(
    'survey error for incorrect JSON',
    () {
      late final Widget widgetWithIncorrectJson;

      final cubitWithIncorrectJson = SurveyCubit(mockSurveyDataRepository);

      void emitForIncorrectJson() {
        cubitWithIncorrectJson.emit(
          SurveyErrorLoadState(
            providedErrors: errorsWithIncorrectJson,
            errorState: SurveyErrorState.collapsed,
          ),
        );
      }

      setUpAll(
        () {
          widgetWithIncorrectJson = AppTester(
            child: BlocBuilder<SurveyCubit, SurveyState>(
              bloc: cubitWithIncorrectJson,
              builder: (context, state) {
                _initializeLocalizations(context);

                return SurveyError(
                  providedErrors: errorsWithIncorrectJson,
                  onDetailsTap: cubitWithIncorrectJson.detailedError,
                  errorState: (state as SurveyErrorLoadState).errorState,
                );
              },
            ),
          );
        },
      );

      testWidgets(
        'should render correctly (with incorrect JSON)',
        (tester) async {
          emitForIncorrectJson();
          await tester.pumpWidget(widgetWithIncorrectJson);

          expect(find.text(_surveyLoadError), findsOneWidget);
          expect(find.text(_showDetails), findsOneWidget);
        },
      );

      testWidgets(
        'should show stacktrace when button pressed (with incorrect JSON)',
        (tester) async {
          emitForIncorrectJson();
          tester.binding.platformDispatcher.textScaleFactorTestValue = 0.5;

          await tester.pumpWidget(widgetWithIncorrectJson);
          await tester.tap(find.text(_showDetails));
          await tester.pumpAndSettle();

          expect(find.text(_showDetails), findsNothing);
          expect(find.text(_closeDetails), findsOneWidget);
          expect(find.text(errorsWithIncorrectJson.first), findsOneWidget);
          expect(find.text(_damagedJson), findsOneWidget);
          tester.binding.platformDispatcher.clearTextScaleFactorTestValue();
        },
      );

      testWidgets(
        'should show damaged JSON on details page',
        (tester) async {
          emitForIncorrectJson();
          final state = cubitWithIncorrectJson.state as SurveyErrorLoadState;

          tester.binding.platformDispatcher.textScaleFactorTestValue = 0.5;
          await tester.pumpWidget(widgetWithIncorrectJson);
          await tester.tap(find.text(_showDetails));
          await tester.pumpAndSettle();

          expect(find.text(_showDetails), findsNothing);
          expect(find.text(state.providedErrors.last), findsNothing);

          await tester.tap(find.text(_damagedJson));

          await tester.pumpAndSettle();

          expect(find.text(state.providedErrors.last), findsOneWidget);

          tester.binding.platformDispatcher.clearTextScaleFactorTestValue();
        },
      );

      testWidgets(
        'should pop scope from details page correctly',
        (tester) async {
          emitForIncorrectJson();

          await tester.pumpWidget(widgetWithIncorrectJson);

          expect(
            (cubitWithIncorrectJson.state as SurveyErrorLoadState).errorState,
            SurveyErrorState.collapsed,
          );

          await tester.tap(find.text(_showDetails));
          await tester.pumpAndSettle();

          expect(
            (cubitWithIncorrectJson.state as SurveyErrorLoadState).errorState,
            SurveyErrorState.stacktrace,
          );

          final popScopeFinder = find.byType(WillPopScope);
          expect(popScopeFinder, findsOneWidget);
          final popScopeWidget = tester.widget<WillPopScope>(popScopeFinder);

          await popScopeWidget.onWillPop?.call();
          expect(
            (cubitWithIncorrectJson.state as SurveyErrorLoadState).errorState,
            SurveyErrorState.collapsed,
          );
        },
      );
    },
  );

  group(
    'survey error for incorrect filePath',
    () {
      late final Widget widgetWithIncorrectPath;
      final cubitWithIncorrectPath = SurveyCubit(mockSurveyDataRepository);

      void emitForIncorrectPath() {
        cubitWithIncorrectPath.emit(
          SurveyErrorLoadState(
            providedErrors: errorsWithIncorrectPath,
            errorState: SurveyErrorState.collapsed,
          ),
        );
      }

      setUpAll(
        () {
          widgetWithIncorrectPath = AppTester(
            child: BlocBuilder<SurveyCubit, SurveyState>(
              bloc: cubitWithIncorrectPath,
              builder: (context, state) {
                _initializeLocalizations(context);

                return SurveyError(
                  providedErrors: errorsWithIncorrectPath,
                  onDetailsTap: cubitWithIncorrectPath.detailedError,
                  errorState: (state as SurveyErrorLoadState).errorState,
                );
              },
            ),
          );
        },
      );

      testWidgets(
        'should render correctly (with incorrect filePath)',
        (tester) async {
          emitForIncorrectPath();
          await tester.pumpWidget(widgetWithIncorrectPath);

          expect(find.text(_surveyLoadError), findsOneWidget);
          expect(find.text(_showDetails), findsOneWidget);
        },
      );

      testWidgets(
        'should show stacktrace and exception (with incorrect filePath)',
        (tester) async {
          tester.binding.platformDispatcher.textScaleFactorTestValue = 0.5;
          emitForIncorrectPath();
          await tester.pumpWidget(widgetWithIncorrectPath);
          await tester.tap(find.text(_showDetails));
          await tester.pumpAndSettle();

          expect(find.text(_showDetails), findsNothing);
          expect(
            find.text(
              (cubitWithIncorrectPath.state as SurveyErrorLoadState)
                  .providedErrors
                  .first,
            ),
            findsOneWidget,
          );
          expect(find.text(_damagedJson), findsOneWidget);
          expect(
            find.text(
              (cubitWithIncorrectPath.state as SurveyErrorLoadState)
                  .providedErrors
                  .last,
            ),
            findsNothing,
          );
          await tester.tap(find.text(_damagedJson));
          await tester.pumpAndSettle();
          expect(
            find.text(
              (cubitWithIncorrectPath.state as SurveyErrorLoadState)
                  .providedErrors
                  .last,
            ),
            findsOneWidget,
          );

          tester.binding.platformDispatcher.clearTextScaleFactorTestValue();
        },
      );
      testWidgets(
        'should pop scope from details page correctly',
            (tester) async {
          emitForIncorrectPath();

          await tester.pumpWidget(widgetWithIncorrectPath);

          expect(
            (cubitWithIncorrectPath.state as SurveyErrorLoadState).errorState,
            SurveyErrorState.collapsed,
          );

          await tester.tap(find.text(_showDetails));
          await tester.pumpAndSettle();

          expect(
            (cubitWithIncorrectPath.state as SurveyErrorLoadState).errorState,
            SurveyErrorState.stacktrace,
          );

          final popScopeFinder = find.byType(WillPopScope);
          expect(popScopeFinder, findsOneWidget);
          final popScopeWidget = tester.widget<WillPopScope>(popScopeFinder);

          await popScopeWidget.onWillPop?.call();
          expect(
            (cubitWithIncorrectPath.state as SurveyErrorLoadState).errorState,
            SurveyErrorState.collapsed,
          );
        },
      );
    },
  );
}
