import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:survey_core/src/domain/entities/question_answer.dart';
import 'package:survey_core/src/domain/entities/question_types/intro_question_data.dart';
import 'package:survey_core/src/presentation/intro_question/intro_question_page.dart';

import 'widget/app_test.dart';

void main() {
  group(
    'Intro question widget test',
    () {
      final completerOnMainButtonTap = Completer<void>();
      final completerOnSecondButton = Completer<void>();
      const title = 'Intro widget';
      const mainButtonTitle = 'NEXT';
      const secondaryButtonTitle = 'SKIP';
      const content =
          'You may simply need a single, brief answer without discussion.';

      final introQuestionPage = AppTest(
        child: IntroQuestionPage(
          data: const IntroQuestionData(
            buttonText: mainButtonTitle,
            index: 1,
            title: title,
            content: content,
            subtitle: '',
            isSkip: false,
          ),
          onMainButtonTap: completerOnMainButtonTap.complete,
          onSecondaryButtonTap: completerOnSecondButton.complete,
          onSend: ({required int index, required QuestionAnswer answer}) {},
        ),
      );

      testWidgets(
        'All content widget test',
        (widgetTester) async {
          await widgetTester.pumpWidget(introQuestionPage);
          expect(find.text(mainButtonTitle), findsOneWidget);
          expect(find.text(secondaryButtonTitle), findsOneWidget);
          expect(find.text(content), findsOneWidget);
          expect(find.text(title), findsOneWidget);
        },
      );
      testWidgets(
        'Buttons test',
        (widgetTester) async {
          await widgetTester.pumpWidget(introQuestionPage);
          await widgetTester.tap(find.text(mainButtonTitle));
          expect(completerOnMainButtonTap.isCompleted, isTrue);
          await widgetTester.tap(find.text(secondaryButtonTitle));
          expect(completerOnSecondButton.isCompleted, isTrue);
        },
      );
    },
  );
}
