import 'package:flutter_test/flutter_test.dart';
import 'package:survey_admin/presentation/widgets/customization_items/customization_items_container.dart';
import 'package:survey_admin/presentation/widgets/customization_items/customization_multiline_text_field.dart';
import 'package:survey_admin/presentation/widgets/customization_panel/input/input_content_customization_tab.dart';

import '../app_test.dart';

void main() {
  group(
    'Input content customization tab tests',
    () {
      const testText = 'Text for test';
      var textTitle = '';
      var textSubtitle = '';
      var textHint = '';
      var textButton = '';
      final page = AppTest(
        child: InputContentCustomizationTab(
          title: 'title',
          onTitleChanged: (value) => textTitle = value,
          onSubtitleChanged: (value) => textSubtitle = value,
          onHintTextChanged: (value) => textHint = value,
          onButtonTextChanged: (value) => textButton = value,
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
