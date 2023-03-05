import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:survey_core/src/domain/entities/question_types/input_question_data.dart';
import 'package:survey_core/src/domain/entities/validator/input_validator.dart';
import 'package:survey_core/src/presentation/input_question/input_question_page.dart';
import 'package:survey_core/src/presentation/widgets/question_bottom_button.dart';

import 'widget/app_test.dart';

void _mockOnSend({required String key, required dynamic data}) {}

void main() {
  const mockInputData = InputQuestionData(
    validator: DefaultValidator(),
    index: 0,
    title: 'title',
    subtitle: 'subtitle',
    isSkip: true,
  );
  group(
    'input question page ->',
    () {
      testWidgets(
        'InputQuestionPage displays title',
        (WidgetTester tester) async {
          await tester.pumpWidget(
            const AppTest(
              child: InputQuestionPage(
                data: mockInputData,
                onSend: _mockOnSend,
              ),
            ),
          );
          final titleFinder = find.text('title');
          expect(titleFinder, findsOneWidget);
        },
      );

      testWidgets(
        'InputQuestionPage displays subtitle',
        (WidgetTester tester) async {
          await tester.pumpWidget(
            const AppTest(
              child: InputQuestionPage(
                data: mockInputData,
                onSend: _mockOnSend,
              ),
            ),
          );
          final subtitleFinder = find.text('subtitle');
          expect(subtitleFinder, findsOneWidget);
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
                onSend: ({data, required key}) => isPressed = true,
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
                onSend: ({data, required key}) => sentData = data,
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
