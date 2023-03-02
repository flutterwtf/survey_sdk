import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:survey_core/src/domain/entities/question_types/intro_question_data.dart';
import 'package:survey_core/src/presentation/intro_question/intro_question_page.dart';

void main() {
  group(
    'Intro question widget test',
    () {
      final completerOnMainButtonTap = Completer<void>();
      final completerOnSecondaryButtonTap = Completer<void>();
      const title = 'Intro widget';
      const mainButtonTitle = 'Next';
      const secondaryButtonTitle = 'Previous';
      const content =
          'You may simply need a single, brief answer without discussion.';

      final introQuestionPage = MaterialApp(
        home: Scaffold(
          body: IntroQuestionPage(
            data: const IntroQuestionData(
              mainButtonTitle: mainButtonTitle,
              index: 1,
              title: title,
              content: content,
              subtitle: '',
              isSkip: false,
            ),
            onMainButtonTap: completerOnMainButtonTap.complete,
            onSecondaryButtonTap: completerOnSecondaryButtonTap.complete,
            onSend: (data) {},
          ),
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
          expect(completerOnSecondaryButtonTap.isCompleted, isTrue);
        },
      );
    },
  );
}
