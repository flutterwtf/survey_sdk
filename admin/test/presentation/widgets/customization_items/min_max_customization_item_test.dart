import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:survey_admin/presentation/widgets/customization_items/min_max_customization_item.dart';

void main() {
  final minMaxCustomizationItemPage = MaterialApp(
    supportedLocales: AppLocalizations.supportedLocales,
    localizationsDelegates: const [
      AppLocalizations.delegate,
      GlobalMaterialLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate,
      GlobalCupertinoLocalizations.delegate,
    ],
    home: Scaffold(
      body: MinMaxCustomizationItem(
        initialMin: 50,
        initialMax: 100,
        onChanged: (_, __) {},
      ),
    ),
  );

  testWidgets('Load widget with initial values', (tester) async {
    await tester.pumpWidget(minMaxCustomizationItemPage);

    expect(find.text('50'), findsOneWidget);
    expect(find.text('100'), findsOneWidget);
  });

  testWidgets('Check input', (tester) async {
    await tester.pumpWidget(minMaxCustomizationItemPage);

    await tester.enterText(find.text('50'), '0');
    expect(find.text('0'), findsOneWidget);

    await tester.enterText(find.text('100'), '30');
    expect(find.text('30'), findsOneWidget);

    await tester.enterText(find.text('30'), 'text with number 40');
    expect(find.text('40'), findsOneWidget);
  });

  testWidgets('Check onChanged', (tester) async {
    int? min;
    int? max;
    await tester.pumpWidget(
      MaterialApp(
        supportedLocales: AppLocalizations.supportedLocales,
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        home: Scaffold(
          body: MinMaxCustomizationItem(
            initialMin: 50,
            initialMax: 100,
            onChanged: (newMin, newMax) {
              min = newMin;
              max = newMax;
            },
          ),
        ),
      ),
    );

    await tester.enterText(find.text('50'), '0');
    expect(min, 0);

    await tester.enterText(find.text('100'), '30');
    expect(max, 30);

    await tester.enterText(find.text('30'), 'text with number 40');
    expect(max, 40);
  });

  testWidgets('Check onChanged (min > max cases)', (tester) async {
    int? min = 50;
    int? max = 100;
    await tester.pumpWidget(
      MaterialApp(
        supportedLocales: AppLocalizations.supportedLocales,
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        home: Scaffold(
          body: MinMaxCustomizationItem(
            initialMin: min,
            initialMax: max,
            onChanged: (newMin, newMax) {
              min = newMin;
              max = newMax;
            },
          ),
        ),
      ),
    );

    // enter 1000 to min input field (bad: min > max)
    // min should not change
    await tester.enterText(find.text('50'), '1000');
    expect(min, 50);

    // enter 400 to min input field (bad: min > max)
    // min should not change
    await tester.enterText(find.text('1000'), '400');
    expect(min, 50);

    // enter 40 to min input field (good)
    await tester.enterText(find.text('400'), '40');
    expect(min, 40);

    // enter 0 to max input field (bad: max < min)
    // max should not change
    await tester.enterText(find.text('100'), '0');
    expect(max, 100);

    // enter 120 to max input field (good)
    await tester.enterText(find.text('0'), '120');
    expect(max, 120);
  });
}
