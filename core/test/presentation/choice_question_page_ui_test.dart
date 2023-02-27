import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:survey_core/src/presentation/choice_question/choice_question_page.dart';

import '../utils/mocked_entities.dart';

void main() {
  group('components of Choice Question widget', () {
    testWidgets('Load widget', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: ChoiceQuestionPage(
              data: MockedQuestions.choice1,
              onSend: (_) {},
            ),
          ),
        ),
      );
      expect(find.text('title'), findsOneWidget);
      expect(find.text('content'), findsOneWidget);
      expect(find.text('option'), findsNWidgets(3));
    });

    testWidgets('Non skippable without answer', (tester) async {
      final completer = Completer<void>();
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: ChoiceQuestionPage(
              onSend: completer.complete,
              data: MockedQuestions.choice1,
            ),
          ),
        ),
      );
      await tester.tap(find.text('NEXT'));
      expect(completer.isCompleted, isFalse);
    });

    testWidgets('Skippable without answer', (tester) async {
      final completer = Completer<void>();
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: ChoiceQuestionPage(
              onSend: completer.complete,
              data: MockedQuestions.choice1,
            ),
          ),
        ),
      );
      await tester.tap(find.text('NEXT'));
      expect(completer.isCompleted, isTrue);
    });
  });

  testWidgets('Single choice without answer', (tester) async {
    final completer = Completer<void>();
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: ChoiceQuestionPage(
            onSend: completer.complete,
            data: MockedQuestions.choice1,
          ),
        ),
      ),
    );
    await tester.tap(find.text('NEXT'));
    expect(completer.isCompleted, isFalse);
  });

  testWidgets('Single choice with answer', (tester) async {
    final completer = Completer<void>();
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: ChoiceQuestionPage(
            onSend: completer.complete,
            data: MockedQuestions.choice1,
          ),
        ),
      ),
    );
    await tester.tap(find.text('option').first);
    await tester.pump();
    await tester.tap(find.text('NEXT'));
    expect(completer.isCompleted, isTrue);
  });

  testWidgets('Single choice with 2 taps option answer', (tester) async {
    final completer = Completer<void>();
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: ChoiceQuestionPage(
            onSend: completer.complete,
            data: MockedQuestions.choice1,
          ),
        ),
      ),
    );
    await tester.tap(find.text('option').first);
    await tester.pump();
    await tester.tap(find.text('option').first);
    await tester.pump();
    await tester.tap(find.text('NEXT'));
    expect(completer.isCompleted, isTrue);
  });

  testWidgets('Multiple choice without answer', (tester) async {
    final completer = Completer<void>();
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: ChoiceQuestionPage(
            onSend: completer.complete,
            data: MockedQuestions.choice1,
          ),
        ),
      ),
    );
    await tester.tap(find.text('NEXT'));
    expect(completer.isCompleted, isFalse);
  });

  testWidgets('Multiple choice with 1 answer', (tester) async {
    final completer = Completer<void>();
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: ChoiceQuestionPage(
            onSend: completer.complete,
            data: MockedQuestions.choice1,
          ),
        ),
      ),
    );
    await tester.tap(find.text('option').first);
    await tester.pump();
    await tester.tap(find.text('NEXT'));
    expect(completer.isCompleted, isTrue);
  });

  testWidgets('Multiple choice with 2 taps option answer', (tester) async {
    final completer = Completer<void>();
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: ChoiceQuestionPage(
            onSend: completer.complete,
            data: MockedQuestions.choice1,
          ),
        ),
      ),
    );
    await tester.tap(find.text('option').first);
    await tester.pump();
    await tester.tap(find.text('option').first);
    await tester.pump();
    await tester.tap(find.text('NEXT'));
    expect(completer.isCompleted, isFalse);
  });

  testWidgets('Multiple choice with 2 answers', (tester) async {
    final completer = Completer<void>();
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: ChoiceQuestionPage(
            onSend: completer.complete,
            data: MockedQuestions.choice1,
          ),
        ),
      ),
    );
    await tester.tap(find.text('option').first);
    await tester.tap(find.text('option').last);
    await tester.pump();
    await tester.tap(find.text('NEXT'));
    expect(completer.isCompleted, isTrue);
  });
}
