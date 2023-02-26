import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:survey_core/src/presentation/widgets/question_bottom_button.dart';

void main() {
  final completerActive = Completer<void>();
  final completerInactive = Completer<void>();
  final pageActiveButton = MaterialApp(
    home: Scaffold(
      body: QuestionBottomButton(
        text: 'next',
        onPressed: completerActive.complete,
      ),
    ),
  );
  final pageInactiveButton = MaterialApp(
    home: Scaffold(
      body: QuestionBottomButton(
        text: 'next',
        isEnabled: false,
        onPressed: completerInactive.complete,
      ),
    ),
  );

  group('test for Question bottom button', () {
    testWidgets('Load widget', (tester) async {
      await tester.pumpWidget(pageActiveButton);
      expect(find.text('next'), findsOneWidget);
    });

    testWidgets('Tap button(active)', (tester) async {
      await tester.pumpWidget(pageActiveButton);
      await tester.tap(find.byKey(const Key('QBB')));
      expect(completerActive.isCompleted, isTrue);
    });

    testWidgets('Tap button(inactive)', (tester) async {
      await tester.pumpWidget(pageInactiveButton);
      await tester.tap(find.byKey(const Key('QBB')));
      expect(completerInactive.isCompleted, isFalse);
    });
  });
}
