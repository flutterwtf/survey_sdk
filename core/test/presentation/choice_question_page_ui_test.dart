import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:survey_core/src/domain/entities/question_answer.dart';
import 'package:survey_core/src/presentation/choice_question/choice_question_page.dart';

import '../utils/mocked_entities.dart';
import 'widget/app_tester.dart';

//ignore: avoid-unused-parameters
void _mockOnSend({required int index, required QuestionAnswer answer}) {}

void main() {
  group('components of Choice Question widget', () {
    testWidgets('Load widget', (tester) async {
      await tester.pumpWidget(
        const AppTester(
          child: ChoiceQuestionPage(
            data: MockedEntities.choice3,
            onSend: _mockOnSend,
          ),
        ),
      );
      expect(find.text('title'), findsOneWidget);
      // TODO(dev): The content of data should located here, but in widget we
      // TODO(dev): passed the subtitle to this place.
      // TODO(dev): Check ChoiceQuestionPage.
      expect(find.text('subtitle'), findsOneWidget);
      expect(
        find.text('option'),
        findsNWidgets(MockedEntities.choice3.options.length),
      );
    });

    testWidgets('Non skippable without answer', (tester) async {
      final completer = Completer<void>();
      await tester.pumpWidget(
        AppTester(
          child: ChoiceQuestionPage(
            data: MockedEntities.choice3,
            onSend: ({required int index, required QuestionAnswer answer}) {
              expect(
                (answer as QuestionAnswer<List<String>>).answer.isEmpty,
                true,
              );
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
        AppTester(
          child: ChoiceQuestionPage(
            data: MockedEntities.choice3.copyWith(isSkip: true),
            onSend: ({required int index, required QuestionAnswer answer}) {
              expect(
                (answer as QuestionAnswer<List<int>>).answer.isEmpty,
                true,
              );
              completer.complete();
            },
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
      AppTester(
        child: ChoiceQuestionPage(
          data: MockedEntities.choice3,
          onSend: ({required int index, required QuestionAnswer answer}) {
            expect(
              (answer as QuestionAnswer<List<String>>).answer.isEmpty,
              true,
            );
          },
        ),
      ),
    );
    await tester.tap(find.text('NEXT'));
    expect(completer.isCompleted, isFalse);
  });

  testWidgets('Single choice with answer', (tester) async {
    final completer = Completer<void>();
    await tester.pumpWidget(
      AppTester(
        child: ChoiceQuestionPage(
          data: MockedEntities.choice3,
          onSend: ({required int index, required QuestionAnswer answer}) {
            expect((answer as QuestionAnswer<List<int>>).answer.length, 1);
            completer.complete();
          },
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
      AppTester(
        child: ChoiceQuestionPage(
          data: MockedEntities.choice3,
          onSend: ({required int index, required QuestionAnswer answer}) {
            expect((answer as QuestionAnswer<List<int>>).answer.length, 1);
            completer.complete();
          },
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
      AppTester(
        child: ChoiceQuestionPage(
          data: MockedEntities.choice3.copyWith(isMultipleChoice: true),
          onSend: ({required int index, required QuestionAnswer answer}) {
            expect(
              (answer as QuestionAnswer<List<String>>).answer.isEmpty,
              true,
            );
            completer.complete();
          },
        ),
      ),
    );
    await tester.tap(find.text('NEXT'));
    expect(completer.isCompleted, isFalse);
  });

  testWidgets('Multiple choice with 1 answer', (tester) async {
    final completer = Completer<void>();
    await tester.pumpWidget(
      AppTester(
        child: ChoiceQuestionPage(
          data: MockedEntities.choice3.copyWith(isMultipleChoice: true),
          onSend: ({required int index, required QuestionAnswer answer}) {
            expect((answer as QuestionAnswer<List<int>>).answer.length, 1);
            completer.complete();
          },
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
      AppTester(
        child: ChoiceQuestionPage(
          data: MockedEntities.choice3.copyWith(isMultipleChoice: true),
          onSend: ({required int index, required QuestionAnswer answer}) {
            expect(
              (answer as QuestionAnswer<List<String>>).answer.isEmpty,
              true,
            );
            completer.complete();
          },
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
      AppTester(
        child: ChoiceQuestionPage(
          data: MockedEntities.choice3.copyWith(isMultipleChoice: true),
          onSend: ({required int index, required QuestionAnswer answer}) {
            expect((answer as QuestionAnswer<List<int>>).answer.length, 2);
            completer.complete();
          },
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
