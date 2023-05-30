import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:survey_sdk/src/domain/entities/question_types/intro_question_data.dart';
import 'package:survey_sdk/src/presentation/intro_question/intro_question_page.dart';

import 'widget/app_tester.dart';

void main() {
  group(
    'Intro question widget test',
    () {
      final completerOnMainButtonTap = Completer<void>();
      final completerOnSecondButton = Completer<void>();
      const title = 'Intro';
      const mainButtonTitle = 'NEXT';
      const subtitleInCommonData = '';

      final introQuestionPage = AppTester(
        child: IntroQuestionPage(
          data: const IntroQuestionData.common(),
          onMainButtonTap: completerOnMainButtonTap.complete,
          onSecondaryButtonTap: completerOnSecondButton.complete,
        ),
      );

      testWidgets(
        'All content widget test',
        (widgetTester) async {
          await widgetTester.pumpWidget(introQuestionPage);
          expect(find.text(mainButtonTitle), findsOneWidget);
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
        },
      );
    },
  );
}
