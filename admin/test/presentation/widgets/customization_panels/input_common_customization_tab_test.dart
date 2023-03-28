import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:survey_admin/presentation/utils/app_colors.dart';
import 'package:survey_admin/presentation/widgets/customization_items/color_customization_item.dart';
import 'package:survey_admin/presentation/widgets/customization_items/customization_items_container.dart';
import 'package:survey_admin/presentation/widgets/customization_items/customization_widgets/customization_text_field.dart';
import 'package:survey_admin/presentation/widgets/customization_panel/input/input_common_customization_tab.dart';

import '../app_tester.dart';

void main() {
  group(
    'Input common customization tab',
    () {
      const redColorCode = 'FFF44336';
      const textSizeString = '20';
      const textSize = 20;
      const textSizeStringWithLetters = '1LLL';
      const textSizeWithLetters = 1;
      const textSizeStringMoreThan2 = '233';
      const redColor = Color(0xfff44336);
      var fillTextColor = AppColors.black;
      var titleTextColor = AppColors.black;
      var subtitleTextColor = AppColors.black;
      var buttonColor = AppColors.black;
      var buttonTextColor = AppColors.black;
      double? titleTextSize = 10;
      double? subtitleTextSize = 10;
      double? buttonTextSize = 10;

      final page = AppTester(
        child: InputCommonCustomizationTab(
          title: 'title',
          onFillColorPicked: (value) => fillTextColor = value,
          onTitleColorPicked: (value) => titleTextColor = value,
          onTitleFontSizeChanged: (value) => titleTextSize = value,
          onSubtitleColorPicked: (value) => subtitleTextColor = value,
          onSubtitleFontSizeChanged: (value) => subtitleTextSize = value,
          onButtonFirstColorPicked: (value) => buttonColor = value,
          onButtonSecondColorPicked: (value) => buttonTextColor = value,
          onButtonFontSizeChanged: (value) => buttonTextSize = value,
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
            find.widgetWithText(CustomizationItemsContainer, 'Button'),
            findsOneWidget,
          );
          expect(find.byType(ColorCustomizationItem), findsNWidgets(5));
          expect(find.byType(CustomizationTextField), findsNWidgets(5));
        },
      );
      testWidgets(
        'Pick colors test',
        (tester) async {
          await tester.pumpWidget(page);
          await tester.pumpAndSettle();
          final colorTextFields = find.byType(ColorCustomizationItem);
          for (var i = 0; i < colorTextFields.evaluate().length; i++) {
            await tester.enterText(
              colorTextFields.at(i),
              redColorCode,
            );
            await tester.testTextInput.receiveAction(TextInputAction.done);
          }
          await tester.pump();

          expect(find.text(redColorCode), findsNWidgets(5));

          expect(fillTextColor, redColor);
          expect(titleTextColor, redColor);
          expect(subtitleTextColor, redColor);
          expect(buttonColor, redColor);
          expect(buttonTextColor, redColor);
        },
      );
    },
  );
}
