import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:intl/intl.dart';
import 'package:survey_core/src/presentation/di/injector.dart';
import 'package:survey_core/src/presentation/survey/survey_state.dart';
import 'package:survey_core/survey_core.dart';

import '../presentation/widget/app_test.dart';
import '../utils/mocked_entities.dart';

void main() {
  group('Input question page test', () {
    Widget app(List<QuestionData> questions) {
      return AppTest(
        child: Survey(
          surveyData: MockedEntities.data2.copyWith(questions: questions),
        ),
      );
    }

    testWidgets('input page', (tester) async {
      await tester.pumpWidget(app([MockedEntities.input3]));
      final cubit = Injector().surveyCubit;

      // click NEXT with valid data
      await tester.enterText(find.byType(TextFormField), '1234');
      await tester.tap(find.text('NEXT'));
      await tester.pumpAndSettle();
      expect(
        (cubit.state as SurveyLoadedState).answers.length,
        1,
      );
      // click NEXT with invalid data
      await tester.enterText(find.byType(TextFormField), 'invalid');
      await tester.tap(find.text('NEXT'));
      await tester.pumpAndSettle();
      expect(
        (cubit.state as SurveyLoadedState).answers.length,
        1,
      );
    });

    testWidgets('input page skip answer', (tester) async {
      await tester.pumpWidget(app([MockedEntities.input3]));
      final cubit = Injector().surveyCubit;
      final skipButton = find.text('SKIP');
      expect(skipButton, findsOneWidget);
      final inputField = find.byType(TextFormField);
      // click skip without answer
      await tester.tap(skipButton);
      expect((cubit.state as SurveyLoadedState).answers.isEmpty, true);
      // click skip with valid data
      await tester.enterText(inputField, '1234');
      await tester.tap(skipButton);
      expect((cubit.state as SurveyLoadedState).answers.isEmpty, true);
      // click skip with invalid data
      await tester.enterText(inputField, 'aa');
      await tester.tap(skipButton);
      expect((cubit.state as SurveyLoadedState).answers.isEmpty, true);
    });

    testWidgets(
      'Test input page with email validator',
      (tester) async {
        await tester.pumpWidget(
          app(
            [
              MockedEntities.input1.copyWith(
                validator: InputValidator.email(),
                theme: const InputQuestionTheme.common()
                    .copyWith(inputType: InputType.email),
              ),
            ],
          ),
        );
        final cubit = Injector().surveyCubit;
        final inputField = find.byType(TextFormField);
        final nextButton = find.text('NEXT');
        //final skipButton = find.text('SKIP');

        /*// click SKIP without data
        await tester.tap(skipButton);
        tester.pumpAndSettle();
        expect((cubit.state as SurveyLoadedState).answers.length, 0);*/
        // click NEXT without data
        await tester.tap(nextButton);
        expect((cubit.state as SurveyLoadedState).answers.length, 0);

        await tester.enterText(inputField, 'user@gmail.com');
        // click Skip with valid data
        /*await tester.tap(skipButton);
        tester.pumpAndSettle();
        expect((cubit.state as SurveyLoadedState).answers.length, 0);*/
        // click NEXT with valid data
        await tester.pumpAndSettle();
        await tester.tap(nextButton);
        expect((cubit.state as SurveyLoadedState).answers.length, 1);
        // click Skip with invalid data
        /*await tester.enterText(inputField, 'user@gmail');
        await tester.tap(skipButton);
        tester.pumpAndSettle();
        expect((cubit.state as SurveyLoadedState).answers.length, 1);*/
        // click NEXT with invalid data
        await tester.tap(nextButton);
        await tester.pumpAndSettle();
        expect((cubit.state as SurveyLoadedState).answers.length, 1);
      },
    );

    testWidgets('input page with phone validator', (tester) async {
      await tester.pumpWidget(
        app(
          [
            MockedEntities.input1.copyWith(
              validator: InputValidator.phone(),
              theme: const InputQuestionTheme.common()
                  .copyWith(inputType: InputType.phone),
            ),
          ],
        ),
      );
      final cubit = Injector().surveyCubit;
      final inputField = find.byType(TextFormField);
      final nextButton = find.text('NEXT');

      //press NEXT without data
      await tester.tap(nextButton);
      expect((cubit.state as SurveyLoadedState).answers.length, 0);

      // press NEXT with valid data
      await tester.enterText(inputField, '+3751111111');
      await tester.pumpAndSettle();
      await tester.tap(nextButton);
      expect((cubit.state as SurveyLoadedState).answers.length, 1);

      //press NEXT with invalid data
      await tester.enterText(inputField, '+375111');
      await tester.pumpAndSettle();
      await tester.tap(nextButton);
      expect((cubit.state as SurveyLoadedState).answers.length, 1);
    });

    testWidgets('input page with data validator', (tester) async {
      await tester.pumpWidget(
        app(
          [
            MockedEntities.input1.copyWith(
              validator: InputValidator.date(),
              theme: const InputQuestionTheme.common()
                  .copyWith(inputType: InputType.date),
            ),
          ],
        ),
      );
      final inputField = find.byType(DateTimeField);
      final nextButton = find.text('NEXT');
      final cubit = Injector().surveyCubit;

      await tester.tap(nextButton);
      expect((cubit.state as SurveyLoadedState).answers.isEmpty, true);

      await tester.tap(inputField);
      await tester.pumpAndSettle();
      await tester.tap(find.text('OK'));
      await tester.pumpAndSettle();
      await tester.tap(nextButton);
      expect((cubit.state as SurveyLoadedState).answers.length, 1);
      expect(
        DateFormat('dd.MM.yyyy').format(
          (cubit.state as SurveyLoadedState).answers[0]?.answer,
        ),
        DateFormat('dd.MM.yyyy').format(DateTime.now()),
      );
    });
  });
}
