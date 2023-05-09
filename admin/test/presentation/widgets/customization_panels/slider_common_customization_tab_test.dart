import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:survey_admin/presentation/widgets/customization_items/color_customization_item.dart';
import 'package:survey_admin/presentation/widgets/customization_items/customization_items_container.dart';
import 'package:survey_admin/presentation/widgets/customization_items/customization_widgets/customization_text_field.dart';
import 'package:survey_admin/presentation/widgets/customization_panel/slider/slider_common_customization_tab.dart';
import 'package:survey_sdk/survey_sdk.dart';

import '../app_tester.dart';

void main() {
  group('Tests for SliderCommonCustomizationTab', () {
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
        find.widgetWithText(CustomizationItemsContainer, 'Primary button'),
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
      expect(data.theme?.fill, const Color(0xF7272799));

      await tester.enterText(
        find.widgetWithText(CustomizationItemsContainer, 'Fill'),
        'F',
      );
      await tester.testTextInput.receiveAction(TextInputAction.done);
      await tester.pump();
      expect(find.text('F0000000'), findsOneWidget);
      expect(data.theme?.fill, const Color(0xF0000000));

      await tester.enterText(
        find.widgetWithText(CustomizationItemsContainer, 'Fill'),
        '',
      );
      await tester.testTextInput.receiveAction(TextInputAction.done);
      await tester.pump();
      expect(find.text('00000000'), findsOneWidget);
      expect(data.theme?.fill, const Color(0x00000000));
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
      expect(data.theme?.titleColor, const Color(0xF1234567));

      await tester.enterText(find.byType(ColorCustomizationItem).at(1), 'F1');
      await tester.testTextInput.receiveAction(TextInputAction.done);
      await tester.pump();
      expect(find.text('F1000000'), findsOneWidget);
      expect(data.theme?.titleColor, const Color(0xF1000000));

      await tester.enterText(find.byType(ColorCustomizationItem).at(1), '');
      await tester.testTextInput.receiveAction(TextInputAction.done);
      await tester.pump();
      expect(find.text('00000000'), findsOneWidget);
      expect(data.theme?.titleColor, const Color(0x00000000));
    });

    testWidgets('Input size(num) for Title', (tester) async {
      await tester.pumpWidget(page);
      await tester.enterText(find.byType(CustomizationTextField).at(2), '10');
      expect(find.text('10'), findsOneWidget);
      expect(data.theme?.titleSize, 10);
    });

    testWidgets('Input size(string) for Title', (tester) async {
      await tester.pumpWidget(page);
      await tester.enterText(find.byType(CustomizationTextField).at(2), 'q1');
      expect(find.text('q1'), findsNothing);
    });

    testWidgets('Validate input size length > 2 for Title', (tester) async {
      await tester.pumpWidget(page);
      await tester.enterText(find.byType(CustomizationTextField).at(2), '112');
      expect(find.text('112'), findsNothing);
      expect(data.theme?.titleSize, 11);
    });

    testWidgets('Input color for Subtitle', (tester) async {
      await tester.pumpWidget(page);
      await tester.enterText(
        find.byType(ColorCustomizationItem).at(2),
        'F7654321',
      );
      await tester.testTextInput.receiveAction(TextInputAction.done);
      await tester.pump();
      expect(find.text('F7654321'), findsOneWidget);
      expect(data.theme?.subtitleColor, const Color(0xF7654321));

      await tester.enterText(find.byType(ColorCustomizationItem).at(2), 'F7');
      await tester.testTextInput.receiveAction(TextInputAction.done);
      await tester.pump();
      expect(find.text('F7000000'), findsOneWidget);
      expect(data.theme?.subtitleColor, const Color(0xF7000000));

      await tester.enterText(find.byType(ColorCustomizationItem).at(2), '');
      await tester.testTextInput.receiveAction(TextInputAction.done);
      await tester.pump();
      expect(find.text('00000000'), findsOneWidget);
      expect(data.theme?.subtitleColor, const Color(0x00000000));
    });

    testWidgets('Input size(num) for Subtitle', (tester) async {
      await tester.pumpWidget(page);
      await tester.enterText(find.byType(CustomizationTextField).at(4), '8');
      expect(find.text('8'), findsOneWidget);
      expect(data.theme?.subtitleSize, 8);
    });

    testWidgets('Input size(string) for Subtitle', (tester) async {
      await tester.pumpWidget(page);
      await tester.enterText(find.byType(CustomizationTextField).at(4), '9q');
      expect(find.text('9q'), findsNothing);
    });

    testWidgets('Validate input size length > 2 for Subtitle', (tester) async {
      await tester.pumpWidget(page);
      await tester.enterText(find.byType(CustomizationTextField).at(4), '123');
      expect(find.text('123'), findsNothing);
      expect(data.theme?.subtitleSize, 12);
    });

    testWidgets('Input color for UpButton', (tester) async {
      await tester.pumpWidget(page);
      await tester.enterText(
        find.byType(ColorCustomizationItem).at(2),
        'F1234321',
      );
      await tester.testTextInput.receiveAction(TextInputAction.done);
      await tester.pump();
      expect(find.text('F1234321'), findsOneWidget);
      expect(data.theme?.subtitleColor, const Color(0xF1234321));

      await tester.enterText(find.byType(ColorCustomizationItem).at(2), 'F5');
      await tester.testTextInput.receiveAction(TextInputAction.done);
      await tester.pump();
      expect(find.text('F5000000'), findsOneWidget);
      expect(data.theme?.subtitleColor, const Color(0xF5000000));

      await tester.enterText(find.byType(ColorCustomizationItem).at(2), '');
      await tester.testTextInput.receiveAction(TextInputAction.done);
      await tester.pump();
      expect(find.text('00000000'), findsOneWidget);
      expect(data.theme?.subtitleColor, const Color(0x00000000));
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
      expect(data.theme?.primaryButtonTextColor, const Color(0xF4321234));

      await tester.enterText(find.byType(ColorCustomizationItem).last, 'F9');
      await tester.testTextInput.receiveAction(TextInputAction.done);
      await tester.pump();
      expect(find.text('F9000000'), findsOneWidget);
      expect(data.theme?.primaryButtonTextColor, const Color(0xF9000000));

      await tester.enterText(find.byType(ColorCustomizationItem).last, '');
      await tester.testTextInput.receiveAction(TextInputAction.done);
      await tester.pump();
      expect(find.text('00000000'), findsOneWidget);
      expect(data.theme?.primaryButtonTextColor, const Color(0x00000000));
    });

    testWidgets('Input size(num) for DownButton', (tester) async {
      await tester.pumpWidget(page);
      await tester.enterText(find.byType(CustomizationTextField).at(7), '14');
      expect(find.text('14'), findsOneWidget);
      expect(data.theme?.primaryButtonTextSize, 14);
    });

    testWidgets('Input size(string) for DownButton', (tester) async {
      await tester.pumpWidget(page);
      await tester.enterText(find.byType(CustomizationTextField).at(6), 'q4');
      expect(find.text('q4'), findsNothing);
    });

    testWidgets(
      'Validate input size length > 2 for DownButton',
      (tester) async {
        await tester.pumpWidget(page);
        await tester.enterText(
          find.byType(CustomizationTextField).at(7),
          '143',
        );
        expect(find.text('143'), findsNothing);
        expect(data.theme?.primaryButtonTextSize, 14);
      },
    );

    testWidgets('Input size(num) for BorderButton', (tester) async {
      await tester.pumpWidget(page);
      await tester.enterText(find.byType(CustomizationTextField).at(8), '18');
      expect(find.text('18'), findsOneWidget);
      expect(data.theme?.primaryButtonRadius, 18);
    });

    testWidgets('Input size(string) for BorderButton', (tester) async {
      await tester.pumpWidget(page);
      await tester.enterText(find.byType(CustomizationTextField).at(8), 'q8');
      expect(find.text('q8'), findsNothing);
      expect(data.theme?.primaryButtonRadius, 8);
    });

    testWidgets(
      'Validate input size length > 2 for BorderButton',
      (tester) async {
        await tester.pumpWidget(page);
        await tester.enterText(
          find.byType(CustomizationTextField).at(8),
          '198',
        );
        expect(find.text('198'), findsNothing);
        expect(data.theme?.primaryButtonRadius, 19);
      },
    );
  });
}
