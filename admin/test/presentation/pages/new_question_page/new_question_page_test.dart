import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:survey_admin/presentation/pages/new_question_page/new_question_page.dart';
import 'package:mockito/mockito.dart';

class MockNavigatorObserver extends Mock implements NavigatorObserver {}

void main() {
  group('Tests for NewQuestionPage', () {
    final mockObserver = MockNavigatorObserver();
    final page = MaterialApp(
      home: Scaffold(
        body: NewQuestionPage(
          onSubmit: (value) {},
        ),
      ),
      navigatorObservers: [mockObserver],
    );

    testWidgets('Load widget', (tester) async {
      await tester.pumpWidget(page);
      expect(find.text('New screen'), findsOneWidget);
      expect(find.text('ADD'), findsOneWidget);
      expect(find.text('Intro'), findsOneWidget);
      expect(find.text('Title'), findsOneWidget);
      expect(find.text('Image intro'), findsOneWidget);
    });

    testWidgets('Close widget', (tester) async {
      await tester.pumpWidget(page);
      await tester.tap(find.byKey(const Key('Close')));
      await tester.pumpAndSettle();
      expect(find.text('New screen'), findsNothing);
    });

    testWidgets('Move on tab', (tester) async {
      await tester.pumpWidget(page);
      expect(find.text('Title'), findsOneWidget);
      expect(find.text('Image intro'), findsOneWidget);

      await tester.tap(find.text('Choice'));
      await tester.pump();
      expect(find.text('Radio button'), findsOneWidget);
      expect(find.text('Check box'), findsOneWidget);

      await tester.tap(find.text('Slider'));
      await tester.pump();
      expect(find.text('Slider'), findsNWidgets(2));

      await tester.tap(find.text('Custom input'));
      await tester.pump();
      expect(find.text('Single-line input'), findsOneWidget);
      expect(find.text('Multi-line input'), findsOneWidget);

      await tester.tap(find.text('Intro'));
      await tester.pump();
      expect(find.text('Title'), findsOneWidget);
      expect(find.text('Image intro'), findsOneWidget);
    });

    testWidgets('Click ADD', (tester) async {
      await tester.pumpWidget(page);
      await tester.tap(find.widgetWithText(GestureDetector, 'ADD'));
      await tester.pumpAndSettle();
      expect(find.text('ADD'), findsNothing);
    });
  });
}
