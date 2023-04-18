import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:survey_admin/presentation/widgets/customization_panel/intro/intro_customization_panel.dart';
import 'package:survey_admin/presentation/widgets/question_settings_tab_bar.dart';
import 'package:survey_core/survey_core.dart';

import '../app_tester.dart';

void main() {
  group(
    'Intro customization panel',
    () {
      final page = AppTester(
        child: IntroCustomizationPanel(
          onChange: (QuestionData<dynamic> data) {},
          editable: const IntroQuestionData.common(),
        ),
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
