import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:survey_admin/presentation/widgets/customization_items/color_customization_item.dart';
import 'package:survey_admin/presentation/widgets/customization_items/customization_items_container.dart';
import 'package:survey_admin/presentation/widgets/customization_items/customization_widgets/customization_text_field.dart';
import 'package:survey_admin/presentation/widgets/customization_panel/input/input_common_customization_tab.dart';
import 'package:survey_sdk/survey_sdk.dart';

import '../app_tester.dart';

void main() {
  group(
    'Input common customization tab',
    () {
      const redColorCode = 'FFF44336';
      const textSizeString = '20';
      const textSize = 20;
      const textSizeStringWithLetters = '1LLL';
      const textSizeWithLetters = '1';
      const textSizeDoubleWithLetters = 1.0;
      // ignore: prefer-correct-identifier-length
      const textSizeDoubleWithLetters2 = 12.0;
      const textSizeStringMoreThan2 = '233';
      const redColor = Color(0xfff44336);

      var data = InputQuestionData.common();

      final page = AppTester(
        child: InputCommonCustomizationTab(
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
            find.widgetWithText(CustomizationItemsContainer, 'Primary button'),
            findsOneWidget,
          );
          expect(find.byType(ColorCustomizationItem), findsNWidgets(5));
          expect(find.byType(CustomizationTextField), findsNWidgets(9));
        },
      );
      testWidgets(
        'Pick colors test',
        (tester) async {
          await tester.pumpWidget(page);
          await tester.pumpAndSettle();

          await tester.enterText(
            find.byType(ColorCustomizationItem).at(0),
            redColorCode,
          );
          expect(data.theme?.fill, redColor);

          await tester.enterText(
            find.byType(ColorCustomizationItem).at(1),
            redColorCode,
          );
          expect(data.theme?.titleColor, redColor);

          await tester.enterText(
            find.byType(ColorCustomizationItem).at(2),
            redColorCode,
          );
          expect(data.theme?.subtitleColor, redColor);

          await tester.enterText(
            find.byType(ColorCustomizationItem).at(3),
            redColorCode,
          );
          expect(data.theme?.primaryButtonFill, redColor);

          await tester.enterText(
            find.byType(ColorCustomizationItem).at(4),
            redColorCode,
          );
          expect(data.theme?.primaryButtonTextColor, redColor);

          expect(find.text(redColorCode), findsNWidgets(5));
        },
      );
      testWidgets(
        'Pick text size',
        (tester) async {
          await tester.pumpWidget(page);

          await tester.enterText(
            find.byType(CustomizationTextField).at(2),
            textSizeString,
          );
          await tester.testTextInput.receiveAction(TextInputAction.done);
          await tester.pump();
          expect(data.theme?.titleSize, textSize);

          await tester.enterText(
            find.byType(CustomizationTextField).at(4),
            textSizeString,
          );
          await tester.testTextInput.receiveAction(TextInputAction.done);
          await tester.pump();
          expect(data.theme?.subtitleSize, textSize);

          await tester.enterText(
            find.byType(CustomizationTextField).at(7),
            textSizeString,
          );
          await tester.testTextInput.receiveAction(TextInputAction.done);
          await tester.pump();
          expect(data.theme?.primaryButtonTextSize, textSize);

          expect(find.text(textSizeString), findsNWidgets(3));
        },
      );
      testWidgets(
        'Pick text size with letters',
        (tester) async {
          await tester.pumpWidget(page);

          await tester.enterText(
            find.byType(CustomizationTextField).at(2),
            textSizeWithLetters,
          );
          await tester.testTextInput.receiveAction(TextInputAction.done);
          await tester.pump();
          expect(data.theme?.titleSize, textSizeDoubleWithLetters);

          await tester.enterText(
            find.byType(CustomizationTextField).at(4),
            textSizeWithLetters,
          );
          await tester.testTextInput.receiveAction(TextInputAction.done);
          await tester.pump();
          expect(data.theme?.subtitleSize, textSizeDoubleWithLetters);

          await tester.enterText(
            find.byType(CustomizationTextField).at(7),
            textSizeStringWithLetters,
          );
          await tester.testTextInput.receiveAction(TextInputAction.done);
          await tester.pump();
          expect(data.theme?.primaryButtonTextSize, textSizeDoubleWithLetters2);

          expect(find.text(textSizeStringWithLetters), findsNothing);
        },
      );
      testWidgets(
        'Pick text size with more than 2 digits',
        (tester) async {
          await tester.pumpWidget(page);

          await tester.enterText(
            find.byType(CustomizationTextField).at(2),
            textSizeStringMoreThan2,
          );
          await tester.testTextInput.receiveAction(TextInputAction.done);
          await tester.pump();

          await tester.enterText(
            find.byType(CustomizationTextField).at(4),
            textSizeStringMoreThan2,
          );
          await tester.testTextInput.receiveAction(TextInputAction.done);
          await tester.pump();

          await tester.enterText(
            find.byType(CustomizationTextField).at(7),
            textSizeStringMoreThan2,
          );
          await tester.testTextInput.receiveAction(TextInputAction.done);
          await tester.pump();

          expect(find.text(textSizeStringMoreThan2), findsNothing);
        },
      );
    },
  );
}
