import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:survey_core/src/presentation/choice_question/choice_question_page.dart';

void main() {
  group('components of Choice Question widget', () {
    testWidgets('Load widget', (tester) async {
      final completer = Completer<void>();
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: ChoiceQuestionPage(
              title: 'title',
              content: 'content',
              onSend: () {},
              options: const ['option', 'option', 'option'],
              isMultipleChoice: false,
              canBeSkipped: false,
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
              title: 'title',
              content: 'content',
              onSend: completer.complete,
              options: const ['option', 'option', 'option'],
              isMultipleChoice: false,
              canBeSkipped: false,
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
              title: 'title',
              content: 'content',
              onSend: completer.complete,
              options: const ['option', 'option', 'option'],
              isMultipleChoice: false,
              canBeSkipped: true,
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
            title: 'title',
            content: 'content',
            onSend: completer.complete,
            options: const ['option', 'option', 'option'],
            isMultipleChoice: false,
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
            title: 'title',
            content: 'content',
            onSend: completer.complete,
            options: const ['option', 'option', 'option'],
            isMultipleChoice: false,
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
            title: 'title',
            content: 'content',
            onSend: completer.complete,
            options: const ['option', 'option', 'option'],
            isMultipleChoice: false,
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
            title: 'title',
            content: 'content',
            onSend: completer.complete,
            options: const ['option', 'option'],
            isMultipleChoice: true,
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
            title: 'title',
            content: 'content',
            onSend: completer.complete,
            options: const ['option', 'option'],
            isMultipleChoice: true,
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
            title: 'title',
            content: 'content',
            onSend: completer.complete,
            options: const ['option', 'option'],
            isMultipleChoice: true,
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
            title: 'title',
            content: 'content',
            onSend: completer.complete,
            options: const ['option', 'option'],
            isMultipleChoice: true,
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
