import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:survey_admin/presentation/utils/colors.dart';
import 'package:survey_admin/presentation/widgets/customization_items/color_customization_item.dart';
import 'package:survey_admin/presentation/widgets/customization_items/customization_items_container.dart';
import 'package:survey_admin/presentation/widgets/customization_items/customization_widgets/customization_text_field.dart';
import 'package:survey_admin/presentation/widgets/customization_panel/question_common_customization_panel.dart';

void main() {
  group(
    'Question common customization panel',
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
      int? titleTextSize = 10;
      int? subtitleTextSize = 10;
      int? buttonTextSize = 10;

      final questionCommonCustomPanel = MaterialApp(
        supportedLocales: AppLocalizations.supportedLocales,
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        home: Scaffold(
          body: QuestionCommonCustomizationPanel(
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
        ),
      );

      testWidgets(
        'All content widget test',
        (tester) async {
          await tester.pumpWidget(questionCommonCustomPanel);
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
          expect(find.byType(CustomizationTextField), findsNWidgets(8));
        },
      );
      testWidgets(
        'Pick colors test',
        (tester) async {
          await tester.pumpWidget(questionCommonCustomPanel);
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
      testWidgets(
        'Pick text size',
        (tester) async {
          await tester.pumpWidget(questionCommonCustomPanel);

          await tester.enterText(
            find.byType(CustomizationTextField).at(2),
            textSizeString,
          );
          await tester.testTextInput.receiveAction(TextInputAction.done);
          await tester.pump();
          expect(titleTextSize, textSize);

          await tester.enterText(
            find.byType(CustomizationTextField).at(4),
            textSizeString,
          );
          await tester.testTextInput.receiveAction(TextInputAction.done);
          await tester.pump();
          expect(subtitleTextSize, textSize);

          await tester.enterText(
            find.byType(CustomizationTextField).at(7),
            textSizeString,
          );
          await tester.testTextInput.receiveAction(TextInputAction.done);
          await tester.pump();
          expect(buttonTextSize, textSize);

          expect(find.text(textSizeString), findsNWidgets(3));
        },
      );
      testWidgets(
        'Pick text size with letters',
        (tester) async {
          await tester.pumpWidget(questionCommonCustomPanel);

          await tester.enterText(
            find.byType(CustomizationTextField).at(2),
            textSizeStringWithLetters,
          );
          await tester.testTextInput.receiveAction(TextInputAction.done);
          await tester.pump();
          expect(titleTextSize, textSizeWithLetters);

          await tester.enterText(
            find.byType(CustomizationTextField).at(4),
            textSizeStringWithLetters,
          );
          await tester.testTextInput.receiveAction(TextInputAction.done);
          await tester.pump();
          expect(subtitleTextSize, textSizeWithLetters);

          await tester.enterText(
            find.byType(CustomizationTextField).at(7),
            textSizeStringWithLetters,
          );
          await tester.testTextInput.receiveAction(TextInputAction.done);
          await tester.pump();
          expect(buttonTextSize, textSizeWithLetters);

          expect(find.text(textSizeStringWithLetters), findsNothing);
        },
      );
      testWidgets(
        'Pick text size with more than 2 digits',
        (tester) async {
          await tester.pumpWidget(questionCommonCustomPanel);

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