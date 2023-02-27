import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:survey_admin/presentation/widgets/customization_items/customization_items_container.dart';
import 'package:survey_admin/presentation/widgets/customization_panel/intro_content_customization_panel.dart';

void main() {
  group('Tests for IntroContentCustomizationPanel', () {
    final completerOnTitle = Completer<String>();
    final completerOnSubtitle = Completer<String>();
    final completerOnPrimaryButton = Completer<String>();
    bool isVisible = false;
    String textSecondaryButton = '';
    final page = MaterialApp(
      supportedLocales: AppLocalizations.supportedLocales,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      home: Scaffold(
        body: IntroContentCustomizationPanel(
          title: 'Content',
          onTitleChanged: completerOnTitle.complete,
          onPrimaryButtonTextChanged: completerOnPrimaryButton.complete,
          onSecondaryButtonChanged: (isShown, text) {
            isVisible = isShown;
            textSecondaryButton = text;
          },
          onSubtitleChanged: completerOnSubtitle.complete,
        ),
      ),
    );

    testWidgets('Load widget', (tester) async {
      await tester.pumpWidget(page);
      expect(find.text('Title'), findsOneWidget);
      expect(find.text('Subtitle'), findsOneWidget);
      expect(find.text('Primary button'), findsOneWidget);
      expect(find.text('Secondary button'), findsOneWidget);
    });

    testWidgets('Input text for Title', (tester) async {
      await tester.pumpWidget(page);
      await tester.enterText(find.widgetWithText(CustomizationItemsContainer, 'Title'), 'Intro');
      expect(find.text('Intro'), findsOneWidget);
      expect(completerOnTitle.isCompleted, isTrue);
    });

    testWidgets('Input text for Subtitle', (tester) async {
      await tester.pumpWidget(page);
      await tester.enterText(find.widgetWithText(CustomizationItemsContainer, 'Subtitle'), 'sub');
      expect(find.text('sub'), findsOneWidget);
      expect(completerOnSubtitle.isCompleted, isTrue);
    });

    testWidgets('Input text for Primary button', (tester) async {
      await tester.pumpWidget(page);
      await tester.enterText(
          find.widgetWithText(CustomizationItemsContainer, 'Primary button'), 'primary');
      expect(find.text('primary'), findsOneWidget);
      expect(completerOnPrimaryButton.isCompleted, isTrue);
    });

    testWidgets('Unlock Secondary button', (tester) async {
      await tester.pumpWidget(page);
      await tester.tap(find.byKey(const Key('Switch')));
      await tester.pump();
      expect(isVisible, isTrue);
    });

    testWidgets('Lock Secondary button', (tester) async {
      await tester.pumpWidget(page);
      await tester.tap(find.byKey(const Key('Switch')));
      await tester.pump();
      await tester.tap(find.byKey(const Key('Switch')));
      await tester.pump();
      expect(isVisible, isFalse);
    });

    testWidgets('Input text for Secondary button', (tester) async {
      await tester.pumpWidget(page);
      await tester.tap(find.byKey(const Key('Switch')));
      await tester.pump();
      await tester.enterText(
          find.widgetWithText(CustomizationItemsContainer, 'Secondary button'), 'qq');
      expect(find.text('qq'), findsOneWidget);
      expect(textSecondaryButton, 'qq');
    });
  });
}
