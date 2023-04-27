import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:survey_client/src/domain/entities/question_answer.dart';
import 'package:survey_client/src/domain/entities/question_types/intro_question_data.dart';
import 'package:survey_client/src/presentation/intro_question/intro_question_page.dart';

import 'widget/app_tester.dart';

void main() {
  group(
    'Intro question widget test',
    () {
      final completerOnMainButtonTap = Completer<void>();
      final completerOnSecondButton = Completer<void>();
      const title = 'Intro';
      const mainButtonTitle = 'NEXT';
      const secondaryButtonTitle = 'SKIP';
      const subtitleInCommonData = '';

      final introQuestionPage = AppTester(
        child: IntroQuestionPage(
          data: const IntroQuestionData.common(),
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
          // TODO(dev): The content of data should located here, but in widget
          // TODO(dev): we passed the subtitle to this place.
          // TODO(dev): Check IntroQuestionPage widget.
          expect(find.text(subtitleInCommonData), findsNothing);
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
