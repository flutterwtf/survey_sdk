import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:survey_core/src/domain/entities/question_types/choice_question_data.dart';
import 'package:survey_core/src/presentation/choice_question/choice_question_page.dart';

import 'widget/app_test.dart';

void _mockOnSend({required String key, required dynamic data}) {}

void main() {
  const usualMockChoiceData = ChoiceQuestionData(
    title: 'title',
    content: 'content',
    options: ['option', 'option', 'option'],
    isMultipleChoice: false,
    isSkip: false,
    index: 0,
    subtitle: '',
  );
  group('components of Choice Question widget', () {
    testWidgets('Load widget', (tester) async {
      await tester.pumpWidget(
        const AppTest(
          child: ChoiceQuestionPage(
            data: usualMockChoiceData,
            onSend: _mockOnSend,
          ),
        ),
      );
      expect(find.text('title'), findsOneWidget);
      expect(find.text('content'), findsOneWidget);
      expect(
        find.text('option'),
        findsNWidgets(usualMockChoiceData.options.length),
      );
    });

    testWidgets('Non skippable without answer', (tester) async {
      final completer = Completer<void>();
      await tester.pumpWidget(
        AppTest(
          child: ChoiceQuestionPage(
            data: usualMockChoiceData,
            onSend: ({data, String? key}) {
              completer.complete();
            },
          ),
        ),
      );
      await tester.tap(find.text('NEXT'));
      expect(completer.isCompleted, isFalse);
    });

    testWidgets('Skippable without answer', (tester) async {
      final completer = Completer<void>();
      await tester.pumpWidget(
        AppTest(
          child: ChoiceQuestionPage(
            data: usualMockChoiceData.copyWith(isSkip: true),
            onSend: ({data, String? key}) => completer.complete(),
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
      const AppTest(
        child: ChoiceQuestionPage(
          data: usualMockChoiceData,
          onSend: _mockOnSend,
        ),
      ),
    );
    await tester.tap(find.text('NEXT'));
    expect(completer.isCompleted, isFalse);
  });

  testWidgets('Single choice with answer', (tester) async {
    final completer = Completer<void>();
    await tester.pumpWidget(
      AppTest(
        child: ChoiceQuestionPage(
          data: usualMockChoiceData,
          onSend: ({data, String? key}) => completer.complete(),
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
      AppTest(
        child: ChoiceQuestionPage(
          data: usualMockChoiceData,
          onSend: ({data, String? key}) => completer.complete(),
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
      AppTest(
        child: ChoiceQuestionPage(
          data: usualMockChoiceData.copyWith(isMultipleChoice: true),
          onSend: ({data, String? key}) => completer.complete(),
        ),
      ),
    );
    await tester.tap(find.text('NEXT'));
    expect(completer.isCompleted, isFalse);
  });

  testWidgets('Multiple choice with 1 answer', (tester) async {
    final completer = Completer<void>();
    await tester.pumpWidget(
      AppTest(
        child: ChoiceQuestionPage(
          data: usualMockChoiceData.copyWith(isMultipleChoice: true),
          onSend: ({data, String? key}) => completer.complete(),
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
      AppTest(
        child: ChoiceQuestionPage(
          data: usualMockChoiceData.copyWith(isMultipleChoice: true),
          onSend: ({data, String? key}) => completer.complete(),
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
      AppTest(
        child: ChoiceQuestionPage(
          data: usualMockChoiceData.copyWith(isMultipleChoice: true),
          onSend: ({data, String? key}) => completer.complete(),
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
