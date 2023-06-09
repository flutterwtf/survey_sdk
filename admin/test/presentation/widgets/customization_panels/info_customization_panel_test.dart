import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:survey_admin/presentation/widgets/customization_panel/info/info_customization_panel.dart';
import 'package:survey_admin/presentation/widgets/question_settings_tab_bar.dart';
import 'package:survey_sdk/survey_sdk.dart';

import '../app_tester.dart';

void main() {
  group(
    'Info customization panel',
    () {
      final page = AppTester(
        child: InfoCustomizationPanel(
          onChange: (QuestionData<dynamic> data) {},
          editable: const InfoQuestionData.common(),
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
