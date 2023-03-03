import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:survey_admin/presentation/widgets/customization_panel/intro_customization_panel.dart';
import 'package:survey_admin/presentation/widgets/question_settings_tab_bar.dart';

void main() {
  group(
    'Intro customization panel',
    () {
      const introCustomizationPanel = MaterialApp(
        supportedLocales: AppLocalizations.supportedLocales,
        localizationsDelegates: [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        home: Scaffold(
          body: IntroCustomizationPanel(),
        ),
      );

      testWidgets(
        'rendered correctly',
        (widgetTester) async {
          await widgetTester.pumpWidget(introCustomizationPanel);
          await widgetTester.pumpAndSettle();
          expect(find.byType(QuestionSettingsTabBar), findsOneWidget);
          expect(find.byType(Tab), findsNWidgets(2));
        },
      );
    },
  );
}
