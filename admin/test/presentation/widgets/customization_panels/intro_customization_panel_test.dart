import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:survey_admin/presentation/widgets/customization_panel/intro/intro_customization_panel.dart';
import 'package:survey_admin/presentation/widgets/question_settings_tab_bar.dart';

import '../app_test.dart';

void main() {
  group(
    'Intro customization panel',
    () {
      const page = AppTest(
        child: IntroCustomizationPanel(),
      );

      testWidgets(
        'rendered correctly',
        (widgetTester) async {
          await widgetTester.pumpWidget(page);
          await widgetTester.pumpAndSettle();
          expect(find.byType(QuestionSettingsTabBar), findsOneWidget);
          expect(find.byType(Tab), findsNWidgets(2));
        },
      );
    },
  );
}
