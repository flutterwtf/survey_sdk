import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:survey_admin/presentation/pages/new_question_page/new_question_page.dart';
import 'package:survey_admin/presentation/widgets/vector_image.dart';

import '../../widgets/app_tester.dart';

//ignore: prefer-match-file-name
class MockNavigatorObserver extends Mock implements NavigatorObserver {}

void main() {
  group('Tests for NewQuestionPage', () {
    final mockObserver = MockNavigatorObserver();
    final page = AppTester(
      navigatorObservers: [mockObserver],
      child: const NewQuestionPage(),
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
      final closeButton = find.byWidgetPredicate(
        (widget) => widget is Container && widget.child is VectorImage,
      );

      await tester.pumpWidget(page);
      await tester.tap(closeButton, warnIfMissed: false);
      await tester.pumpAndSettle();
      expect(find.text('ADD'), findsNothing);
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
      // TODO(dev): Will be changed when context is removed from CommonData.

      final addButton = find.widgetWithText(Center, 'ADD');
      await tester.pumpWidget(page);
      expect(addButton, findsOneWidget);

      /*await tester.tap(addButton);*/
      /*await tester.pumpAndSettle();
      expect(addButton, findsNothing);*/
    });
  });
}
