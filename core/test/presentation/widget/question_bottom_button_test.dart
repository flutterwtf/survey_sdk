import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:survey_sdk/src/presentation/widgets/question_bottom_button.dart';

import 'app_tester.dart';

void main() {
  const next = 'NEXT';

  group(
    'question bottom button',
    () {
      testWidgets(
        'button should render correctly',
        (tester) async {
          await tester.pumpWidget(
            AppTester(
              child: QuestionBottomButton(
                text: next,
                onPressed: () {},
              ),
            ),
          );

          expect(find.text(next), findsOneWidget);
        },
      );

      testWidgets(
        'button should be pressed correctly',
        (tester) async {
          final completer = Completer<void>();

          await tester.pumpWidget(
            AppTester(
              child: QuestionBottomButton(
                text: next,
                onPressed: completer.complete,
              ),
            ),
          );

          final buttonFinder = find.text(next);

          expect(buttonFinder, findsOneWidget);

          await tester.tap(buttonFinder);
          await tester.pumpAndSettle();

          expect(completer.isCompleted, isTrue);
        },
      );
    },
  );
}
