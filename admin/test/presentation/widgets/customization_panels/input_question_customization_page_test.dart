import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:survey_admin/presentation/widgets/customization_panel/input_question_customization_page.dart';
import 'package:survey_admin/presentation/widgets/question_settings_tab_bar.dart';

void main() {
  group(
    'Input question customization page tests',
    () {
      final inputQuestionCustomizationPage = MaterialApp(
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
              InputQuestionCustomizationPage(),
            ],
          ),
        ),
      );

      testWidgets(
        'load content widget test',
        (widgetTester) async {
          await widgetTester.pumpWidget(inputQuestionCustomizationPage);
          await widgetTester.pumpAndSettle();

          expect(find.byType(InputQuestionCustomizationPage), findsOneWidget);
          expect(find.byType(QuestionSettingsTabBar), findsOneWidget);

          expect(find.text('Common'), findsOneWidget);
          expect(find.text('Input'), findsOneWidget);
          expect(find.text('Content'), findsOneWidget);
        },
      );
    },
  );
}
