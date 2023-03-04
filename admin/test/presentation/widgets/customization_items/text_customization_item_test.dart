import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:survey_admin/presentation/widgets/hex_color_field.dart';
import 'package:survey_admin/presentation/widgets/text_customize_item.dart';
import 'package:survey_admin/presentation/widgets/text_width_field.dart';

void main() {
  group(
    'Slider question widget test',
    () {
      final completerOnColorPicked = Completer<Color>();
      final completerOnTextWidthPicked = Completer<int>();
      const title = 'Text customization item';
      const initialTextWidth = 10;
      const initialColor = Colors.black;
      const newColorHex = 'FFC91515';
      const newWidth = '12';

      final textCustomizationItem = MaterialApp(
        supportedLocales: AppLocalizations.supportedLocales,
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        home: Scaffold(
          body: TextCustomizeItem(
            title: title,
            initialTextWidth: initialTextWidth,
            initialColor: initialColor,
            onColorPicked: completerOnColorPicked.complete,
            onTextWidthPicked: completerOnTextWidthPicked.complete,
          ),
        ),
      );

      testWidgets(
        'All content widget test',
        (widgetTester) async {
          await widgetTester.pumpWidget(textCustomizationItem);
          await widgetTester.pumpAndSettle();
          expect(find.byType(HexColorField), findsOneWidget);
          expect(find.byType(TextWidthField), findsOneWidget);
        },
      );

      testWidgets(
        'Color text input test',
        (widgetTester) async {
          await widgetTester.pumpWidget(textCustomizationItem);
          await widgetTester.pumpAndSettle();
          await widgetTester.enterText(find.byType(HexColorField), newColorHex);
          expect(find.text(newColorHex), findsOneWidget);
        },
      );
      testWidgets(
        'Width text input test',
        (widgetTester) async {
          await widgetTester.pumpWidget(textCustomizationItem);
          await widgetTester.pumpAndSettle();
          await widgetTester.enterText(find.byType(TextWidthField), newWidth);
          expect(find.text(newWidth), findsOneWidget);
        },
      );
    },
  );
}
