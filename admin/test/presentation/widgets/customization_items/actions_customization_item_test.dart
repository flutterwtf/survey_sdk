import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:survey_admin/presentation/app/localization/app_localizations_ext.dart';
import 'package:survey_admin/presentation/widgets/customization_items/actions_customization_item.dart';
import 'package:survey_admin/presentation/widgets/customization_items/customization_widgets/customization_text_field.dart';
import 'package:survey_admin/presentation/widgets/customization_items/dropdown_customization_button.dart';
import 'package:survey_admin/presentation/widgets/vector_image.dart';
import 'package:survey_sdk/survey_sdk.dart';

import '../app_tester.dart';

SurveyAction? _surveyAction;

void main() {
  const questionsLength = 5;

  late String goToQuestion;
  late String finishSurvey;
  late String skipQuestion;

  group(
    'ActionsCustomizationItem render group',
    () {
      late Widget testWidget;

      setUp(
        () {
          testWidget = AppTester(
            child: Builder(
              builder: (context) {
                goToQuestion = context.localization.goToQuestion;
                finishSurvey = context.localization.finishSurvey;
                skipQuestion = context.localization.skipQuestion;

                return ActionsCustomizationItem(
                  onChanged: _mockedOnChanged,
                  surveyAction: _surveyAction,
                  questionsLength: questionsLength,
                );
              },
            ),
          );
        },
      );

      testWidgets(
        'should render correctly',
        (tester) async {
          await tester.pumpWidget(testWidget);

          expect(find.byType(ActionsCustomizationItem), findsOneWidget);
        },
      );

      testWidgets(
        'should switch to GoTo',
        (tester) async {
          await tester.pumpWidget(testWidget);

          expect(find.byType(VectorImage), findsNothing);

          await tester.tap(
            find.byType(DropdownCustomizationButton<SurveyAction?>),
          );
          await tester.pumpAndSettle();
          expect(find.text(goToQuestion), findsOneWidget);
          expect(find.text(skipQuestion), findsOneWidget);
          expect(find.text(finishSurvey), findsOneWidget);

          await tester.tap(find.text(goToQuestion));
          await tester.pumpAndSettle();

          expect(_surveyAction.runtimeType, GoToAction);
        },
      );

      testWidgets(
        'should switch to SkipQuestion',
        (tester) async {
          _surveyAction = GoToAction(questionIndex: 0);

          await tester.pumpWidget(testWidget);

          expect(find.byType(CustomizationTextField), findsOneWidget);
          expect(find.text(goToQuestion), findsOneWidget);

          await tester.enterText(find.byType(CustomizationTextField), '2');
          expect(find.text('2'), findsOneWidget);

          await tester.tap(
            find.byType(DropdownCustomizationButton<SurveyAction?>),
          );
          await tester.pumpAndSettle();
          expect(find.text(skipQuestion), findsOneWidget);
          expect(find.text(finishSurvey), findsOneWidget);

          await tester.tap(find.text(skipQuestion));
          await tester.pumpAndSettle();

          expect(_surveyAction.runtimeType, SkipQuestionAction);
        },
      );

      testWidgets(
        'should switch to FinishSurvey',
        (tester) async {
          _surveyAction = SkipQuestionAction();

          await tester.pumpWidget(testWidget);

          expect(find.text(skipQuestion), findsOneWidget);

          await tester.tap(
            find.byType(DropdownCustomizationButton<SurveyAction?>),
          );
          await tester.pumpAndSettle();
          expect(find.text(goToQuestion), findsOneWidget);
          expect(find.text(finishSurvey), findsOneWidget);

          await tester.tap(find.text(finishSurvey));
          await tester.pumpAndSettle();

          expect(_surveyAction.runtimeType, FinishSurveyAction);
        },
      );

      testWidgets(
        'should clear survey action',
            (tester) async {
          _surveyAction = FinishSurveyAction();

          await tester.pumpWidget(testWidget);

          expect(find.text(finishSurvey), findsOneWidget);
          expect(find.byType(VectorImage), findsOneWidget);

          await tester.tap(find.byType(VectorImage));
          await tester.pumpAndSettle();

          expect(_surveyAction, isNull);
        },
      );
    },
  );
}

void _mockedOnChanged(SurveyAction? surveyAction) =>
    _surveyAction = surveyAction;
