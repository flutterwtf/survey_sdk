import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:survey_core/src/domain/entities/question_types/input_question_data.dart';
import 'package:survey_core/src/domain/entities/validator/input_validator.dart';
import 'package:survey_core/src/presentation/input_question/input_question_page.dart';
import 'package:survey_core/src/presentation/widgets/question_bottom_button.dart';

import 'widget/app_test.dart';

void main() {
  String testValidDefaultValidator = 'test string1';
  String testInvalidNumberValidator = 'test string2';
  String testValidNumberValidator = '12';

  const mockInputData = InputQuestionData(
    validator: DefaultValidator(),
    index: 0,
    title: 'title',
    subtitle: 'subtitle',
    isSkip: true,
  );

  const mockInputDataWithNumberValidator = InputQuestionData(
    validator: NumberValidator(),
    index: 0,
    title: 'title',
    subtitle: 'subtitle',
    isSkip: true,
  );

  group(
    'input question page ->',
    () {
      test('Valid string returns null', () {
        var result = DefaultValidator().validate(
          testValidDefaultValidator,
        );
        expect(result, null);
      });

      test('Valid number returns null', () {
        var result = NumberValidator().validate(
          testValidNumberValidator,
        );
        expect(result, null);
      });

      testWidgets(
        'DefaultValidator should tell when input is not valid',
            (WidgetTester tester) async {
          String? sentData;
          await tester.pumpWidget(
            AppTest(
              child: InputQuestionPage(
                data: mockInputData.copyWith(isSkip: true),
                onSend: ({data, String? key}) => sentData = data,
              ),
            ),
          );
          final inputField = find.byType(TextFormField);
          await tester.enterText(inputField, testValidDefaultValidator);
          await tester.pumpAndSettle();
          expect(find.text('This field cannot be empty'), findsNothing);
        },
      );

      testWidgets(
        'NumberValidator should tell when number is not valid',
        (WidgetTester tester) async {
          String? sentData;
          await tester.pumpWidget(
            AppTest(
              child: InputQuestionPage(
                data: mockInputDataWithNumberValidator.copyWith(isSkip: true),
                onSend: ({data, String? key}) => sentData = data,
              ),
            ),
          );

          final inputField = find.byType(TextFormField);
          await tester.enterText(inputField, testInvalidNumberValidator);
          await tester.pumpAndSettle();
          expect(find.text('Please enter a valid number'), findsOneWidget);
        },
      );

      testWidgets(
        'InputQuestionPage displays "Skip" button when isSkip is true',
        (WidgetTester tester) async {
          var isPressed = false;
          await tester.pumpWidget(
            AppTest(
              child: InputQuestionPage(
                data: mockInputData.copyWith(isSkip: true),
                onSend: ({data, String? key}) => isPressed = true,
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
            AppTest(
              child: InputQuestionPage(
                data: mockInputData.copyWith(isSkip: true),
                onSend: ({data, String? key}) => sentData = data,
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
