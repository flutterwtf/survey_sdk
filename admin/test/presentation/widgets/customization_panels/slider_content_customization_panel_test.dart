import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:survey_admin/presentation/widgets/customization_items/customization_items_container.dart';
import 'package:survey_admin/presentation/widgets/customization_panel/slider_content_customization_panel.dart';

void main() {
  group('Tests for IntroContentCustomizationPanel', () {
    int? min;
    int? max;
    String title = '';
    String subtitle = '';
    int? value;
    final page = MaterialApp(
      supportedLocales: AppLocalizations.supportedLocales,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      home: Scaffold(
        body: SliderContentCustomizationPanel(
          title: 'Content',
          onDivisionsChanged: (newValue) {
            value = newValue;
          },
          onMinMaxChanged: (newMin, newMax) {
            min = newMin;
            max = newMax;
          },
          onSubtitleChanged: (newSubtitle) {
            subtitle = newSubtitle;
          },
          onTitleChanged: (newTitle) {
            title = newTitle;
          },
        ),
      ),
    );

    testWidgets('Load widget', (tester) async {
      await tester.pumpWidget(page);
      expect(find.text('Title'), findsOneWidget);
      expect(find.text('Subtitle'), findsOneWidget);
      expect(find.text('Value'), findsOneWidget);
      expect(find.text('Divisions'), findsOneWidget);
    });

    testWidgets('Input text for Title', (tester) async {
      await tester.pumpWidget(page);
      await tester.enterText(find.widgetWithText(CustomizationItemsContainer, 'Title'), 'title');
      expect(find.text('title'), findsOneWidget);
      expect(title, 'title');
    });

    testWidgets('Input text for Subtitle', (tester) async {
      await tester.pumpWidget(page);
      await tester.enterText(find.widgetWithText(CustomizationItemsContainer, 'Subtitle'), 'sub');
      expect(find.text('sub'), findsOneWidget);
      expect(subtitle, 'sub');
    });

    testWidgets('Input num for Divisions', (tester) async {
      await tester.pumpWidget(page);
      await tester.enterText(find.widgetWithText(CustomizationItemsContainer, 'Divisions'), '1');
      expect(find.text('1'), findsOneWidget);
      expect(value, 1);
    });

    testWidgets('Input text for Divisions', (tester) async {
      await tester.pumpWidget(page);
      await tester.enterText(find.widgetWithText(CustomizationItemsContainer, 'Divisions'), 'q');
      expect(find.text('q'), findsNothing);
      expect(value, null);
    });

    testWidgets('Validate length > 3 input for Divisions', (tester) async {
      await tester.pumpWidget(page);
      await tester.enterText(find.widgetWithText(CustomizationItemsContainer, 'Divisions'), '1234');
      expect(find.text('1234'), findsNothing);
      expect(value, 123);
    });

    testWidgets('Input min,max for Value(num)', (tester) async {
      await tester.pumpWidget(page);
      await tester.enterText(find.byKey(const ValueKey('min')), '5');
      expect(find.text('5'), findsOneWidget);
      expect(min, 5);

      await tester.enterText(find.byKey(const ValueKey('max')), '15');
      expect(find.text('15'), findsOneWidget);
      expect(max, 15);
    });

    testWidgets('Input min,max for Value(string)', (tester) async {
      await tester.pumpWidget(page);
      await tester.enterText(find.byKey(const ValueKey('min')), 'qw');
      expect(find.text('qw'), findsNothing);
      expect(min, null);

      await tester.enterText(find.byKey(const ValueKey('max')), 'qw');
      expect(find.text('qw'), findsNothing);
      expect(max, null);
    });

    testWidgets('Validate length > 6 input min,max for Value', (tester) async {
      await tester.pumpWidget(page);
      await tester.enterText(find.byKey(const ValueKey('max')), '9876543');
      expect(find.text('987654'), findsOneWidget);
      expect(max, 987654);

      await tester.enterText(find.byKey(const ValueKey('min')), '2345678');
      expect(find.text('234567'), findsOneWidget);
      expect(min, 234567);
    });

    testWidgets('Validate min>max for Value', (tester) async {
      await tester.pumpWidget(page);
      await tester.enterText(find.byKey(const ValueKey('max')), '100');
      expect(max, 100);

      await tester.enterText(find.byKey(const ValueKey('min')), '101');
      expect(min, 0);

      await tester.enterText(find.byKey(const ValueKey('min')), '505');
      expect(min, 0);

      await tester.enterText(find.byKey(const ValueKey('min')), '99');
      expect(min, 99);
    });
  });
}