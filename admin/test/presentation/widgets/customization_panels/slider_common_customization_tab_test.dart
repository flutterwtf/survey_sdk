import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:survey_admin/presentation/widgets/customization_items/color_customization_item.dart';
import 'package:survey_admin/presentation/widgets/customization_items/customization_items_container.dart';
import 'package:survey_admin/presentation/widgets/customization_panel/slider/slider_common_customization_tab.dart';
import 'package:survey_core/survey_core.dart';

import '../app_tester.dart';

void main() {
  group(
    'Tests for SliderCommonCustomizationTab',
    () {
      const fill = Colors.red;
      const buttonDownColor = Colors.red;
      const buttonUpColor = Colors.red;
      const titleColor = Colors.red;
      const subtitleColor = Colors.red;

      var data = const SliderQuestionData.common();
      final page = AppTester(
        child: SliderCommonCustomizationTab(
          title: 'Common',
          onChange: (QuestionData<dynamic> newData) {
            data = newData as SliderQuestionData;
          },
          editable: data,
        ),
      );

      testWidgets('Load widget', (tester) async {
        await tester.pumpWidget(page);
        expect(
          find.widgetWithText(CustomizationItemsContainer, 'Fill'),
          findsOneWidget,
        );
        expect(
          find.widgetWithText(CustomizationItemsContainer, 'Title'),
          findsOneWidget,
        );
        expect(
          find.widgetWithText(CustomizationItemsContainer, 'Subtitle'),
          findsOneWidget,
        );
        expect(
          find.widgetWithText(CustomizationItemsContainer, 'Button'),
          findsOneWidget,
        );
      });

      testWidgets('Input color for Fill', (tester) async {
        await tester.pumpWidget(page);
        await tester.enterText(
          find.widgetWithText(CustomizationItemsContainer, 'Fill'),
          'F7272799',
        );
        await tester.testTextInput.receiveAction(TextInputAction.done);
        await tester.pump();
        expect(find.text('F7272799'), findsOneWidget);
        expect(fill, const Color(0xF7272799));

        await tester.enterText(
          find.widgetWithText(CustomizationItemsContainer, 'Fill'),
          'F',
        );
        await tester.testTextInput.receiveAction(TextInputAction.done);
        await tester.pump();
        expect(find.text('F0000000'), findsOneWidget);
        expect(fill, const Color(0xF0000000));

        await tester.enterText(
          find.widgetWithText(CustomizationItemsContainer, 'Fill'),
          '',
        );
        await tester.testTextInput.receiveAction(TextInputAction.done);
        await tester.pump();
        expect(find.text('0'), findsOneWidget);
        expect(fill, const Color(0x00000000));
      });

      testWidgets('Input color for Title', (tester) async {
        await tester.pumpWidget(page);
        await tester.enterText(
          find.byType(ColorCustomizationItem).at(1),
          'F1234567',
        );
        await tester.testTextInput.receiveAction(TextInputAction.done);
        await tester.pump();
        expect(find.text('F1234567'), findsOneWidget);
        expect(titleColor, const Color(0xF1234567));

        await tester.enterText(find.byType(ColorCustomizationItem).at(1), 'F1');
        await tester.testTextInput.receiveAction(TextInputAction.done);
        await tester.pump();
        expect(find.text('F1000000'), findsOneWidget);
        expect(titleColor, const Color(0xF1000000));

        await tester.enterText(find.byType(ColorCustomizationItem).at(1), '');
        await tester.testTextInput.receiveAction(TextInputAction.done);
        await tester.pump();
        expect(find.text('0'), findsOneWidget);
        expect(titleColor, const Color(0x00000000));
      });

      // TODO(dev): Whe we have this here?
      /*testWidgets('Input size(num) for Title', (tester) async {
      await tester.pumpWidget(page);
      await tester.enterText(find.byType(CustomizationTextField).at(2), '10');
      expect(find.text('10'), findsOneWidget);
      expect(titleSize, 10);
    });

    testWidgets('Input size(string) for Title', (tester) async {
      await tester.pumpWidget(page);
      await tester.enterText(find.byType(CustomizationTextField).at(2), 'q1');
      expect(find.text('q1'), findsNothing);
      expect(titleSize, 1);
    });

    testWidgets('Validate input size length > 2 for Title', (tester) async {
      await tester.pumpWidget(page);
      await tester.enterText(find.byType(CustomizationTextField).at(2), '112');
      expect(find.text('112'), findsNothing);
      expect(titleSize, 11);
    });*/

      testWidgets('Input color for Subtitle', (tester) async {
        await tester.pumpWidget(page);
        await tester.enterText(
          find.byType(ColorCustomizationItem).at(2),
          'F7654321',
        );
        await tester.testTextInput.receiveAction(TextInputAction.done);
        await tester.pump();
        expect(find.text('F7654321'), findsOneWidget);
        expect(subtitleColor, const Color(0xF7654321));

        await tester.enterText(find.byType(ColorCustomizationItem).at(2), 'F7');
        await tester.testTextInput.receiveAction(TextInputAction.done);
        await tester.pump();
        expect(find.text('F7000000'), findsOneWidget);
        expect(subtitleColor, const Color(0xF7000000));

        await tester.enterText(find.byType(ColorCustomizationItem).at(2), '');
        await tester.testTextInput.receiveAction(TextInputAction.done);
        await tester.pump();
        expect(find.text('0'), findsOneWidget);
        expect(subtitleColor, const Color(0x00000000));
      });
      testWidgets('Input color for UpButton', (tester) async {
        await tester.pumpWidget(page);
        await tester.enterText(
          find.byType(ColorCustomizationItem).at(3),
          'F1234321',
        );
        await tester.testTextInput.receiveAction(TextInputAction.done);
        await tester.pump();
        expect(find.text('F1234321'), findsOneWidget);
        expect(buttonUpColor, const Color(0xF1234321));

        await tester.enterText(find.byType(ColorCustomizationItem).at(3), 'F5');
        await tester.testTextInput.receiveAction(TextInputAction.done);
        await tester.pump();
        expect(find.text('F5000000'), findsOneWidget);
        expect(buttonUpColor, const Color(0xF5000000));

        await tester.enterText(find.byType(ColorCustomizationItem).at(3), '');
        await tester.testTextInput.receiveAction(TextInputAction.done);
        await tester.pump();
        expect(find.text('0'), findsOneWidget);
        expect(buttonUpColor, const Color(0x00000000));
      });

      testWidgets('Input color for DownButton', (tester) async {
        await tester.pumpWidget(page);
        await tester.enterText(
          find.byType(ColorCustomizationItem).last,
          'F4321234',
        );
        await tester.testTextInput.receiveAction(TextInputAction.done);
        await tester.pump();
        expect(find.text('F4321234'), findsOneWidget);
        expect(buttonDownColor, const Color(0xF4321234));

        await tester.enterText(find.byType(ColorCustomizationItem).last, 'F9');
        await tester.testTextInput.receiveAction(TextInputAction.done);
        await tester.pump();
        expect(find.text('F9000000'), findsOneWidget);
        expect(buttonDownColor, const Color(0xF9000000));

        await tester.enterText(find.byType(ColorCustomizationItem).last, '');
        await tester.testTextInput.receiveAction(TextInputAction.done);
        await tester.pump();
        expect(find.text('0'), findsOneWidget);
        expect(buttonDownColor, const Color(0x00000000));
      });
    },
  );
}
