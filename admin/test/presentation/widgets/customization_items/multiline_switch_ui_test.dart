import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:survey_admin/presentation/widgets/customization_items/customization_widgets/customization_text_field.dart';
import 'package:survey_admin/presentation/widgets/customization_items/multiline_switch.dart';

import '../app_tester.dart';

void main() {
  group('Tests for MultilineSwitch', () {
    const title = 'Multiline';
    const inputNum = '12';
    const inputText = 'qwe';
    const inputTitle = 'Lines:';
    final page = AppTester(
      child: MultilineSwitch(
        onChanged: (isMultiline, lineAmount) {},
        value: false,
        lines: 10,
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

    testWidgets(
      'Check widget with parameters isMultiline = true',
      (tester) async {
        await tester.pumpWidget(
          AppTester(
            child: MultilineSwitch(
              value: true,
              lines: 10,
              onChanged: (
                isMultiline,
                lineAmount,
              ) {},
            ),
          ),
        );
        await tester.pumpAndSettle();
        expect(find.text(inputTitle), findsOneWidget);
      },
    );
  });
}
