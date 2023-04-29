import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:survey_admin/presentation/widgets/customization_items/color_customization_item.dart';
import 'package:survey_admin/presentation/widgets/customization_items/customization_items_container.dart';
import 'package:survey_admin/presentation/widgets/customization_items/customization_widgets/customization_text_field.dart';
import 'package:survey_admin/presentation/widgets/customization_items/thickness_customization_item.dart';
import 'package:survey_admin/presentation/widgets/customization_panel/slider/slider_customization_tab.dart';
import 'package:survey_core/survey_core.dart';

import '../app_tester.dart';

void main() {
  group('Tests for SliderCustomizationTab', () {
    var data = const SliderQuestionData.common();
    final page = AppTester(
      child: SliderCustomizationTab(
        title: 'Slider',
        onChange: (QuestionData<dynamic> newData) {
          data = newData as SliderQuestionData;
        },
        editable: data,
      ),
    );

    testWidgets('Load widget', (tester) async {
      await tester.pumpWidget(page);
      expect(
        find.widgetWithText(CustomizationItemsContainer, 'Thickness'),
        findsOneWidget,
      );
      expect(
        find.widgetWithText(CustomizationItemsContainer, 'Active'),
        findsOneWidget,
      );
      expect(
        find.widgetWithText(CustomizationItemsContainer, 'Inactive'),
        findsOneWidget,
      );
      expect(
        find.widgetWithText(CustomizationItemsContainer, 'Thumb'),
        findsOneWidget,
      );
    });

    testWidgets('Input num for Thickness', (tester) async {
      await tester.pumpWidget(page);
      await tester.enterText(
        find.widgetWithText(CustomizationItemsContainer, 'Thickness'),
        '10',
      );
      expect(find.text('10.0'), findsOneWidget);
      expect(data.theme?.thickness, 10);
    });

    testWidgets('Input string for Thickness', (tester) async {
      await tester.pumpWidget(page);
      await tester.enterText(
        find.widgetWithText(CustomizationItemsContainer, 'Thickness'),
        'qw1',
      );
      expect(find.text('qw'), findsNothing);
      expect(data.theme?.thickness, 1);
    });

    testWidgets('Validate input length > 2 for Thickness', (tester) async {
      await tester.pumpWidget(page);
      await tester.enterText(
        find.widgetWithText(CustomizationItemsContainer, 'Thickness'),
        '123',
      );
      expect(find.text('123'), findsNothing);
      expect(data.theme?.thickness, 12);
    });

    testWidgets('Input color for Active', (tester) async {
      await tester.pumpWidget(page);
      await tester.enterText(
        find.widgetWithText(CustomizationItemsContainer, 'Active'),
        'FFF44336',
      );
      await tester.testTextInput.receiveAction(TextInputAction.done);
      await tester.pump();
      expect(find.text('FFF44336'), findsOneWidget);
      expect(data.theme?.activeColor, const Color(0xFFF44336));

      await tester.enterText(
        find.widgetWithText(CustomizationItemsContainer, 'Active'),
        'F',
      );
      await tester.testTextInput.receiveAction(TextInputAction.done);
      await tester.pump();
      expect(find.text('F0000000'), findsOneWidget);
      expect(data.theme?.activeColor, const Color(0xF0000000));

      await tester.enterText(
        find.widgetWithText(CustomizationItemsContainer, 'Active'),
        '',
      );
      await tester.testTextInput.receiveAction(TextInputAction.done);
      await tester.pump();
      expect(find.text('00000000'), findsOneWidget);
      expect(data.theme?.activeColor, const Color(0x00000000));
    });

    testWidgets('Input color for Inactive', (tester) async {
      await tester.pumpWidget(page);
      await tester.enterText(
        find.widgetWithText(CustomizationItemsContainer, 'Inactive'),
        'FFD9D9D9',
      );
      await tester.testTextInput.receiveAction(TextInputAction.done);
      await tester.pump();
      expect(find.text('FFD9D9D9'), findsOneWidget);
      expect(data.theme?.inactiveColor, const Color(0xFFD9D9D9));

      await tester.enterText(
        find.widgetWithText(CustomizationItemsContainer, 'Inactive'),
        'D',
      );
      await tester.testTextInput.receiveAction(TextInputAction.done);
      await tester.pump();
      expect(find.text('D0000000'), findsOneWidget);
      expect(data.theme?.inactiveColor, const Color(0xD0000000));

      await tester.enterText(
        find.widgetWithText(CustomizationItemsContainer, 'Inactive'),
        '',
      );
      await tester.testTextInput.receiveAction(TextInputAction.done);
      await tester.pump();
      expect(find.text('00000000'), findsOneWidget);
      expect(data.theme?.inactiveColor, const Color(0x00000000));
    });

    testWidgets('Input color and num for Thumb', (tester) async {
      await tester.pumpWidget(page);
      await tester.enterText(
        find.byType(ColorCustomizationItem).last,
        'FF717171',
      );
      await tester.testTextInput.receiveAction(TextInputAction.done);
      await tester.pump();
      expect(find.text('FF717171'), findsOneWidget);
      expect(data.theme?.thumbColor, const Color(0xFF717171));

      await tester.enterText(find.byType(ColorCustomizationItem).last, 'C');
      await tester.testTextInput.receiveAction(TextInputAction.done);
      await tester.pump();
      expect(find.text('C0000000'), findsOneWidget);
      expect(data.theme?.thumbColor, const Color(0xC0000000));

      await tester.enterText(find.byType(ColorCustomizationItem).last, '');
      await tester.testTextInput.receiveAction(TextInputAction.done);
      await tester.pump();
      expect(find.text('00000000'), findsOneWidget);
      expect(data.theme?.thumbColor, const Color(0x00000000));

      await tester.enterText(find.byType(ThicknessCustomizationItem).last, '8');
      expect(find.text('8.0'), findsOneWidget);
      expect(data.divisions, 8);
    });
  });
}
