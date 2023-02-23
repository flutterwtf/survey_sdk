import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:survey_core/src/domain/entities/question_types/input_question_data.dart';
import 'package:survey_core/src/domain/entities/validator/input_validator.dart';
import 'package:survey_core/src/presentation/input_question/input_question_page.dart';
import 'package:survey_core/src/presentation/widgets/question_bottom_button.dart';

void main() {
  group(
    'input question page ->',
    () {
      testWidgets('InputQuestionPage displays title',
          (WidgetTester tester) async {
        await tester.pumpWidget(MaterialApp(
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
          ],
          home: Scaffold(
            body: InputQuestionPage(
              data: InputQuestionData(
                validator: DefaultValidator(),
                value: 0,
                id: 0,
                title: 'title',
                subtitle: 'subtitle',
                typeQuestion: 'typeQuestion',
                isSkip: false,
              ),
              onSend: (_) {},
            ),
          ),
        ));
        final titleFinder = find.text('title');
        expect(titleFinder, findsOneWidget);
      });

      testWidgets('InputQuestionPage displays subtitle',
          (WidgetTester tester) async {
        await tester.pumpWidget(MaterialApp(
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
          ],
          home: Scaffold(
            body: InputQuestionPage(
              data: InputQuestionData(
                validator: DefaultValidator(),
                value: 0,
                id: 0,
                title: 'title',
                subtitle: 'subtitle',
                typeQuestion: 'typeQuestion',
                isSkip: false,
              ),
              onSend: (_) {},
            ),
          ),
        ));
        final subtitleFinder = find.text('subtitle');
        expect(subtitleFinder, findsOneWidget);
      });

      testWidgets(
          'InputQuestionPage displays "Skip" button when isSkip is true',
          (WidgetTester tester) async {
        var isPressed = false;
        await tester.pumpWidget(MaterialApp(
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
          ],
          home: Scaffold(
            body: InputQuestionPage(
              data: InputQuestionData(
                validator: DefaultValidator(),
                value: 0,
                id: 0,
                title: 'title',
                subtitle: 'subtitle',
                typeQuestion: 'typeQuestion',
                isSkip: true,
              ),
              onSend: (_) => isPressed = true,
            ),
          ),
        ));
        await tester.tap(find.byType(QuestionBottomButton));
        await tester.pump();
        expect(isPressed, true);
        expect(find.byType(QuestionBottomButton), findsOneWidget);
      });

      testWidgets('InputQuestionPage calls onSend callback with user input',
          (WidgetTester tester) async {
        final inputQuestionData = InputQuestionData(
          validator: DefaultValidator(),
          value: 0,
          id: 0,
          title: 'title',
          subtitle: 'subtitle',
          typeQuestion: 'typeQuestion',
          isSkip: true,
        );
        String? sentData;
        await tester.pumpWidget(
          MaterialApp(
            localizationsDelegates: const [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
            ],
            home: Scaffold(
              body: InputQuestionPage(
                data: inputQuestionData,
                onSend: (data) => sentData = data,
              ),
            ),
          ),
        );

        const userInput = 'inputText';
        await tester.enterText(find.byType(FormBuilderTextField), userInput);
        await tester.tap(find.byType(QuestionBottomButton));
        expect(sentData, equals(userInput));
      });
    },
  );
}
