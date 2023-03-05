import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:survey_admin/presentation/widgets/customization_items/customization_widgets/customization_text_field.dart';
import 'package:survey_admin/presentation/widgets/customization_items/multiline_switch.dart';

import '../app_test.dart';

void main() {
  group('Tests for MultilineSwitch', () {
    const title = 'Multiline';
    const inputNum = '12';
    const inputText = 'qwe';
    const inputTitle = 'Lines';
    final page = AppTest(
      child: MultilineSwitch(
        onChanged: (bool isMultiline, int lineAmount) {},
      ),
    );

    testWidgets('Load widget', (tester) async {
      await tester.pumpWidget(page);
      expect(find.text(title), findsOneWidget);
    });

    testWidgets('Open multiline input(tap on switch)', (tester) async {
      await tester.pumpWidget(page);
      await tester.tap(find.byType(InkWell));
      await tester.pump();
      expect(find.text(inputTitle), findsOneWidget);
    });

    testWidgets('Close multiline input(double tap on switch)', (tester) async {
      await tester.pumpWidget(page);
      await tester.tap(find.byType(InkWell));
      await tester.pump();
      await tester.tap(find.byType(InkWell));
      await tester.pump();
      expect(find.text(inputTitle), findsNothing);
    });

    testWidgets('Input count lines(num)', (tester) async {
      await tester.pumpWidget(page);
      await tester.tap(find.byType(InkWell));
      await tester.pump();
      await tester.enterText(find.byType(CustomizationTextField), inputNum);
      expect(find.text(inputNum), findsOneWidget);
    });

    testWidgets('Input count lines(not num)', (tester) async {
      await tester.pumpWidget(page);
      await tester.tap(find.byType(InkWell));
      await tester.pump();
      await tester.enterText(find.byType(CustomizationTextField), inputText);
      expect(find.text(inputText), findsNothing);
    });

    testWidgets('Check widget with parameters isMultiline = true',
        (tester) async {
      await tester.pumpWidget(
        AppTest(
          child: MultilineSwitch(
            isMultiline: true,
            onChanged: (bool isMultiline, int lineAmount) {},
          ),
        ),
      );
      await tester.pumpAndSettle();
      expect(find.text(inputTitle), findsOneWidget);
    });
  });
}
