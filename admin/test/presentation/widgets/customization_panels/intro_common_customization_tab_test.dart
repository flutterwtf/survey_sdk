import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:survey_admin/presentation/widgets/customization_items/customization_items_container.dart';
import 'package:survey_admin/presentation/widgets/customization_panel/intro_common_customization_tab.dart';

void main() {
  group(
    'Intro common customization tab tests',
    () {
      final introCommonCustomPanel = MaterialApp(
        supportedLocales: AppLocalizations.supportedLocales,
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        home: Scaffold(
          body: IntroCommonCustomizationTab(
            title: 'title',
            onFillColorPicked: (value) {},
            onTitleColorPicked: (value) {},
            onTitleFontSizeChanged: (value) {},
            onSubtitleColorPicked: (value) {},
            onSubtitleFontSizeChanged: (value) {},
            onButtonColorPicked: (value) {},
            onButtonTextColorPicked: (value) {},
            onButtonFontSizeChanged: (value) {},
            onButtonRadiusChanged: (value) {},
          ),
        ),
      );

      testWidgets(
        'All content widget test',
        (widgetTester) async {
          await widgetTester.pumpWidget(introCommonCustomPanel);
          await widgetTester.pumpAndSettle();
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
    },
  );
}
