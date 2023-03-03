import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:survey_admin/presentation/widgets/customization_items/customization_items_container.dart';
import 'package:survey_admin/presentation/widgets/customization_panel/slider_customization_panel.dart';

void main() {
  final sliderCustomizationPage = MaterialApp(
    supportedLocales: AppLocalizations.supportedLocales,
    localizationsDelegates: const [
      AppLocalizations.delegate,
      GlobalMaterialLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate,
      GlobalCupertinoLocalizations.delegate,
    ],
    home: Scaffold(
      body: Row(
        children: const [
          SliderCustomizationPanel(),
        ],
      ),
    ),
  );

  group('SliderCustomizationPanel test', () {
    testWidgets('TabBar contains required tabs', (tester) async {
      await tester.pumpWidget(sliderCustomizationPage);

      expect(find.text('Common'), findsOneWidget);
      expect(find.text('Slider'), findsOneWidget);
      expect(find.text('Content'), findsOneWidget);
    });

    testWidgets(
      'Switch to Common panel and check content',
      (tester) async {
        await tester.pumpWidget(sliderCustomizationPage);

        // switch to Common panel
        await tester.tap(find.text('Common'));
        await tester.pump();
        await tester.pump(const Duration(seconds: 1));

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
      },
    );

    testWidgets(
      'Switch to Slider panel and check content',
      (tester) async {
        await tester.pumpWidget(sliderCustomizationPage);

        // switch to Slider panel
        await tester.tap(find.text('Slider'));
        await tester.pump();
        await tester.pump(const Duration(seconds: 1));

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
      },
    );

    testWidgets(
      'Switch to Content panel and check content',
      (tester) async {
        await tester.pumpWidget(sliderCustomizationPage);

        // switch to Content panel
        await tester.tap(find.text('Content'));
        await tester.pump();
        await tester.pump(const Duration(seconds: 1));

        expect(
          find.widgetWithText(CustomizationItemsContainer, 'Title'),
          findsOneWidget,
        );
        expect(
          find.widgetWithText(CustomizationItemsContainer, 'Subtitle'),
          findsOneWidget,
        );
        expect(
          find.widgetWithText(CustomizationItemsContainer, 'Value'),
          findsOneWidget,
        );
        expect(
          find.widgetWithText(CustomizationItemsContainer, 'Divisions'),
          findsOneWidget,
        );
      },
    );
  });
}
