import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:survey_admin/presentation/app/localization/localizations.dart';
import 'package:survey_admin/presentation/widgets/customization_items/color_customization_item.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:survey_admin/presentation/widgets/customization_items/color_with_text_field_customization_item.dart';
import 'package:survey_admin/presentation/widgets/customization_items/customization_text_field.dart';
import 'package:survey_admin/presentation/widgets/customization_items/radius_customization_item.dart';
import 'package:survey_admin/presentation/widgets/customization_panel/intro_common_customization_panel.dart';

void main() {
  group(
    'Intro common customization panel',
    () {
      const redColorCode = 'FFF44336';
      const textWidth = '20';

      testWidgets(
        'load widget',
        (tester) async {
          final completerOnFillColorPicked = Completer<void>();
          final completerOnButtonColorPicked = Completer<void>();
          final completerOnTitleColorPicked = Completer<void>();
          final completerOnTitleFontSizeChanged = Completer<void>();
          final completerOnSubtitleColorPicked = Completer<void>();
          final completerOnSubtitleFontSizeChanged = Completer<void>();
          final completerOnButtonTextColorPicked = Completer<void>();
          final completerOnButtonFontSizeChanged = Completer<void>();
          final completerOnButtonRadiusChanged = Completer<void>();
          final introCommonCustomPanel = MaterialApp(
            localizationsDelegates: const [
              AppLocalizations.delegate,
            ],
            home: Scaffold(
              body: Builder(
                builder: (context) {
                  return IntroCommonCustomizationPanel(
                    title: context.localization.common,
                    onFillColorPicked: completerOnFillColorPicked.complete,
                    onButtonColorPicked: completerOnButtonColorPicked.complete,
                    onTitleColorPicked: completerOnTitleColorPicked.complete,
                    onTitleFontSizeChanged:
                        completerOnTitleFontSizeChanged.complete,
                    onSubtitleColorPicked:
                        completerOnSubtitleColorPicked.complete,
                    onSubtitleFontSizeChanged:
                        completerOnSubtitleFontSizeChanged.complete,
                    onButtonTextColorPicked:
                        completerOnButtonTextColorPicked.complete,
                    onButtonFontSizeChanged:
                        completerOnButtonFontSizeChanged.complete,
                    onButtonRadiusChanged:
                        completerOnButtonRadiusChanged.complete,
                  );
                },
              ),
            ),
          );
          await tester.pumpWidget(introCommonCustomPanel);
          expect(find.byType(ColorCustomizationItem), findsNWidgets(5));
          expect(find.byType(ColorWithTextFieldCustomizationItem),
              findsNWidgets(3));
          expect(find.byType(RadiusCustomizationItem), findsOneWidget);
        },
      );
      testWidgets(
        'pick colors test',
        (tester) async {
          final completerOnFillColorPicked = Completer<void>();
          final completerOnButtonColorPicked = Completer<void>();
          final completerOnTitleColorPicked = Completer<void>();
          final completerOnTitleFontSizeChanged = Completer<void>();
          final completerOnSubtitleColorPicked = Completer<void>();
          final completerOnSubtitleFontSizeChanged = Completer<void>();
          final completerOnButtonTextColorPicked = Completer<void>();
          final completerOnButtonFontSizeChanged = Completer<void>();
          final completerOnButtonRadiusChanged = Completer<void>();
          final introCommonCustomPanel = MaterialApp(
            localizationsDelegates: const [
              AppLocalizations.delegate,
            ],
            home: Scaffold(
              body: Builder(
                builder: (context) {
                  return IntroCommonCustomizationPanel(
                    title: context.localization.common,
                    onFillColorPicked: completerOnFillColorPicked.complete,
                    onButtonColorPicked: completerOnButtonColorPicked.complete,
                    onTitleColorPicked: completerOnTitleColorPicked.complete,
                    onTitleFontSizeChanged:
                        completerOnTitleFontSizeChanged.complete,
                    onSubtitleColorPicked:
                        completerOnSubtitleColorPicked.complete,
                    onSubtitleFontSizeChanged:
                        completerOnSubtitleFontSizeChanged.complete,
                    onButtonTextColorPicked:
                        completerOnButtonTextColorPicked.complete,
                    onButtonFontSizeChanged:
                        completerOnButtonFontSizeChanged.complete,
                    onButtonRadiusChanged:
                        completerOnButtonRadiusChanged.complete,
                  );
                },
              ),
            ),
          );
          await tester.pumpWidget(introCommonCustomPanel);
          await tester.pumpAndSettle();
          final colorTextFields = find.byType(ColorCustomizationItem);
          for (int i = 0; i < colorTextFields.evaluate().length; i++) {
            await tester.enterText(
              colorTextFields.at(i),
              redColorCode,
            );
            await tester.testTextInput.receiveAction(TextInputAction.done);
          }
          await tester.pump();
          expect(find.text(redColorCode), findsNWidgets(5));
          expect(completerOnFillColorPicked.isCompleted, isTrue);
          expect(completerOnButtonColorPicked.isCompleted, isTrue);
          expect(completerOnTitleColorPicked.isCompleted, isTrue);
          expect(completerOnSubtitleColorPicked.isCompleted, isTrue);
          expect(completerOnButtonTextColorPicked.isCompleted, isTrue);
          expect(completerOnSubtitleFontSizeChanged.isCompleted, isFalse);
          expect(completerOnTitleFontSizeChanged.isCompleted, isFalse);
          expect(completerOnButtonFontSizeChanged.isCompleted, isFalse);
          expect(completerOnButtonFontSizeChanged.isCompleted, isFalse);
          expect(completerOnButtonRadiusChanged.isCompleted, isFalse);
        },
      );
      testWidgets(
        'pick text width and radius test',
        (tester) async {
          final completerOnFillColorPicked = Completer<void>();
          final completerOnButtonColorPicked = Completer<void>();
          final completerOnTitleColorPicked = Completer<void>();
          final completerOnTitleFontSizeChanged = Completer<void>();
          final completerOnSubtitleColorPicked = Completer<void>();
          final completerOnSubtitleFontSizeChanged = Completer<void>();
          final completerOnButtonTextColorPicked = Completer<void>();
          final completerOnButtonFontSizeChanged = Completer<void>();
          final completerOnButtonRadiusChanged = Completer<void>();
          final introCommonCustomPanel = MaterialApp(
            localizationsDelegates: const [
              AppLocalizations.delegate,
            ],
            home: Scaffold(
              body: Builder(
                builder: (context) {
                  return IntroCommonCustomizationPanel(
                    title: context.localization.common,
                    onFillColorPicked: completerOnFillColorPicked.complete,
                    onButtonColorPicked: completerOnButtonColorPicked.complete,
                    onTitleColorPicked: completerOnTitleColorPicked.complete,
                    onTitleFontSizeChanged:
                        completerOnTitleFontSizeChanged.complete,
                    onSubtitleColorPicked:
                        completerOnSubtitleColorPicked.complete,
                    onSubtitleFontSizeChanged:
                        completerOnSubtitleFontSizeChanged.complete,
                    onButtonTextColorPicked:
                        completerOnButtonTextColorPicked.complete,
                    onButtonFontSizeChanged:
                        completerOnButtonFontSizeChanged.complete,
                    onButtonRadiusChanged:
                        completerOnButtonRadiusChanged.complete,
                  );
                },
              ),
            ),
          );
          await tester.pumpWidget(introCommonCustomPanel);
          await tester.pumpAndSettle();
          final textFields = find.byType(CustomizationTextField);
          for (int i = 0; i < textFields.evaluate().length; i++) {
            await tester.enterText(
              textFields.at(i),
              textWidth,
            );
            await tester.testTextInput.receiveAction(TextInputAction.done);
          }
          await tester.pump();
          expect(find.text(textWidth), findsNWidgets(4));
          expect(completerOnTitleFontSizeChanged.isCompleted, isTrue);
          expect(completerOnButtonFontSizeChanged.isCompleted, isTrue);
          expect(completerOnButtonFontSizeChanged.isCompleted, isTrue);
          expect(completerOnButtonRadiusChanged.isCompleted, isTrue);
        },
      );
    },
  );
}
