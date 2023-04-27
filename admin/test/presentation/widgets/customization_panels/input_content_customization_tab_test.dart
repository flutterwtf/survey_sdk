import 'package:flutter_test/flutter_test.dart';
import 'package:survey_admin/presentation/widgets/customization_items/customization_items_container.dart';
import 'package:survey_admin/presentation/widgets/customization_items/customization_multiline_text_field.dart';
import 'package:survey_admin/presentation/widgets/customization_panel/input/input_content_customization_tab.dart';
import 'package:survey_client/survey_client.dart';

import '../app_tester.dart';

void main() {
  group(
    'Input content customization tab tests',
    () {
      const textTitle = 'Text for test1';
      const textSubtitle = 'Text for test2';
      const textHint = 'Text for test3';
      const textButton = 'Text for test4';

      var data = InputQuestionData.common();
      final page = AppTester(
        child: InputContentCustomizationTab(
          title: 'title',
          editable: data,
          onChange: (QuestionData<dynamic> newData) {
            data = newData as InputQuestionData;
          },
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
          expect(
            find.byType(CustomizationMultilineTextField),
            findsNWidgets(4),
          );
        },
      );

      testWidgets(
        'Input text test',
        (tester) async {
          await tester.pumpWidget(page);
          await tester.enterText(
            find.widgetWithText(CustomizationItemsContainer, 'Title'),
            textTitle,
          );
          expect(find.text(textTitle), findsOneWidget);

          await tester.pumpWidget(page);
          await tester.enterText(
            find.widgetWithText(CustomizationItemsContainer, 'Subtitle'),
            textSubtitle,
          );
          expect(textSubtitle, textSubtitle);

          await tester.pumpWidget(page);
          await tester.enterText(
            find.widgetWithText(CustomizationItemsContainer, 'Hint'),
            textHint,
          );
          expect(textHint, textHint);

          await tester.pumpWidget(page);
          await tester.enterText(
            find.widgetWithText(CustomizationItemsContainer, 'Button'),
            textButton,
          );
          expect(textButton, textButton);
        },
      );
    },
  );
}
