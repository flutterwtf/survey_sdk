import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:survey_admin/presentation/widgets/customization_items/create_text_customization_item.dart';
import 'package:survey_admin/presentation/widgets/customization_items/customization_items_container.dart';
import 'package:survey_admin/presentation/widgets/customization_panel/input_content_customization_tab.dart';

void main() {
  group(
    'Input content customization tab tests',
    () {
      const testText = 'Text for test';
      var textTitle = '';
      var textSubtitle = '';
      var textHint = '';
      var textButton = '';
      final page = MaterialApp(
        supportedLocales: AppLocalizations.supportedLocales,
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        home: Scaffold(
          body: InputContentCustomizationTab(
            title: 'title',
            onTitleChanged: (value) => textTitle = value,
            onSubtitleChanged: (value) => textSubtitle = value,
            onHintTextChanged: (value) => textHint = value,
            onButtonTextChanged: (value) => textButton = value,
          ),
        ),
      );

      testWidgets(
        'All content widget test',
        (tester) async {
          await tester.pumpWidget(page);
          expect(find.text('Title'), findsOneWidget);
          expect(find.text('Subtitle'), findsOneWidget);
          expect(find.text('Hint'), findsOneWidget);
          expect(find.text('Button'), findsOneWidget);
          expect(find.byType(CreateTextCustomizationItem), findsNWidgets(4));
        },
      );

      testWidgets(
        'Input text test',
        (tester) async {
          await tester.pumpWidget(page);
          await tester.enterText(
            find.widgetWithText(CustomizationItemsContainer, 'Title'),
            testText,
          );
          expect(textTitle, testText);

          await tester.pumpWidget(page);
          await tester.enterText(
            find.widgetWithText(CustomizationItemsContainer, 'Subtitle'),
            testText,
          );
          expect(textSubtitle, testText);

          await tester.pumpWidget(page);
          await tester.enterText(
            find.widgetWithText(CustomizationItemsContainer, 'Hint'),
            testText,
          );
          expect(textHint, testText);

          await tester.pumpWidget(page);
          await tester.enterText(
            find.widgetWithText(CustomizationItemsContainer, 'Button'),
            testText,
          );
          expect(textButton, testText);

          expect(find.text(testText), findsNWidgets(4));
        },
      );
    },
  );
}
