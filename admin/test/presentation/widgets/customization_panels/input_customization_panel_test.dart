import 'package:flutter_test/flutter_test.dart';
import 'package:survey_admin/presentation/widgets/customization_panel/input/input_customization_panel.dart';
import 'package:survey_admin/presentation/widgets/question_settings_tab_bar.dart';
import 'package:survey_client/survey_client.dart';

import '../app_tester.dart';

void main() {
  group(
    'Input customization panel tests',
    () {
      var data = InputQuestionData.common();
      final page = AppTester(
        child: InputCustomizationPanel(
          onChange: (QuestionData<dynamic> newData) {
            data = newData as InputQuestionData;
          }, editable: data,
        ),
      );

      testWidgets(
        'load content widget test',
        (widgetTester) async {
          await widgetTester.pumpWidget(page);
          await widgetTester.pumpAndSettle();

          expect(find.byType(InputCustomizationPanel), findsOneWidget);
          expect(find.byType(QuestionSettingsTabBar), findsOneWidget);

          expect(find.text('Common'), findsOneWidget);
          expect(find.text('Input'), findsOneWidget);
          expect(find.text('Content'), findsOneWidget);
        },
      );
    },
  );
}
