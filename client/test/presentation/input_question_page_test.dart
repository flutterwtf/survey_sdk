import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:survey_client/src/domain/entities/input_validator.dart';
import 'package:survey_client/src/domain/entities/question_answer.dart';
import 'package:survey_client/src/presentation/input_question/input_question_page.dart';
import 'package:survey_client/src/presentation/widgets/question_bottom_button.dart';

import '../utils/mocked_entities.dart';
import 'widget/app_tester.dart';

// TODO(dev): Make a test for input date
void main() {
  const testValidTextString = 'test string1';
  const testInvalidNumberString = 'test string2';
  const testValidNumberString = '12';

  const validationErrorMessage = 'Validation error';

  final mockInputData = MockedEntities.input1;

  final mockInputWithNumber = mockInputData.copyWith(
    validator: InputValidator.number(),
  );

  group(
    'input question page ->',
    () {
      test('Valid string returns null', () {
        final result = InputValidator.text().validate(
          testValidTextString,
        );
        expect(result, null);
      });

      test('Valid number returns null', () {
        final result = InputValidator.number().validate(
          testValidNumberString,
        );
        expect(result, null);
      });

      testWidgets(
        'DefaultValidator should tell when input is not valid',
        (WidgetTester tester) async {
          String? sendData;
          await tester.pumpWidget(
            AppTester(
              child: InputQuestionPage(
                data: mockInputData,
                onSend: ({
                  required int index,
                  required QuestionAnswer answer,
                }) =>
                    sendData = (answer as QuestionAnswer<String>).answer,
              ),
            ),
          );
          final inputField = find.byType(TextFormField);
          await tester.enterText(inputField, testValidTextString);
          await tester.tap(find.byType(QuestionBottomButton));
          await tester.pumpAndSettle();

          expect(sendData, equals(testValidTextString));
          expect(find.text('This field cannot be empty'), findsNothing);
        },
      );

      testWidgets(
        'NumberValidator should tell when number is not valid',
        (WidgetTester tester) async {
          final validator = mockInputWithNumber.validator;

          String? sendData;
          await tester.pumpWidget(
            AppTester(
              child: InputQuestionPage(
                data: mockInputWithNumber,
                onSend: ({
                  required int index,
                  required QuestionAnswer answer,
                }) =>
                    sendData = (answer as QuestionAnswer<String>).answer,
              ),
            ),
          );

          final validationResult = validator.validate(testInvalidNumberString);

          final inputField = find.byType(TextFormField);
          await tester.enterText(inputField, testInvalidNumberString);
          await tester.tap(find.byType(QuestionBottomButton));
          await tester.pumpAndSettle();

          expect(sendData, isNull);
          expect(validationResult, equals(validationErrorMessage));
        },
      );

      testWidgets(
        'InputQuestionPage displays "Skip" button when isSkip is true',
        (WidgetTester tester) async {
          var isPressed = false;
          await tester.pumpWidget(
            AppTester(
              child: InputQuestionPage(
                data: mockInputData,
                onSend: ({
                  required int index,
                  required QuestionAnswer answer,
                }) =>
                    isPressed = true,
              ),
            ),
          );
          await tester.tap(find.byType(QuestionBottomButton));
          await tester.pump();
          expect(isPressed, true);
          expect(find.byType(QuestionBottomButton), findsOneWidget);
        },
      );

      testWidgets(
        'InputQuestionPage calls onSend callback with user input',
        (WidgetTester tester) async {
          String? sentData;
          await tester.pumpWidget(
            AppTester(
              child: InputQuestionPage(
                data: mockInputData,
                onSend: ({
                  required int index,
                  required QuestionAnswer answer,
                }) =>
                    sentData = (answer as QuestionAnswer<String>).answer,
              ),
            ),
          );

          const userInput = 'inputText';
          await tester.enterText(find.byType(TextFormField), userInput);
          await tester.tap(find.byType(QuestionBottomButton));
          expect(sentData, equals(userInput));
        },
      );
    },
  );
}
