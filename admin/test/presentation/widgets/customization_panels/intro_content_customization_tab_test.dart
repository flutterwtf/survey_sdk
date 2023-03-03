import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:survey_admin/presentation/widgets/customization_items/customization_items_container.dart';
import 'package:survey_admin/presentation/widgets/customization_panel/intro/intro_content_customization_tab.dart';

import '../app_test.dart';

void main() {
  group('Tests for IntroContentCustomizationTab', () {
    var isVisible = false;
    var textSecondaryButton = '';
    var textTitle = '';
    var textSubtitle = '';
    var textPrimaryButton = '';
    final page = AppTest(
      child: IntroContentCustomizationTab(
        title: 'Content',
        onTitleChanged: (newTitle) {
          textTitle = newTitle;
        },
        onPrimaryButtonTextChanged: (newTextPrimaryButton) {
          textPrimaryButton = newTextPrimaryButton;
        },
        onSecondaryButtonChanged: (isShown, text) {
          isVisible = isShown;
          textSecondaryButton = text;
        },
        onSubtitleChanged: (newSubtitle) {
          textSubtitle = newSubtitle;
        },
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
      await tester.enterText(
        find.widgetWithText(CustomizationItemsContainer, 'Title'),
        'Intro',
      );
      expect(find.text('Intro'), findsOneWidget);
      expect(textTitle, 'Intro');
    });

    testWidgets('Input text for Subtitle', (tester) async {
      await tester.pumpWidget(page);
      await tester.enterText(
        find.widgetWithText(CustomizationItemsContainer, 'Subtitle'),
        'sub',
      );
      expect(find.text('sub'), findsOneWidget);
      expect(textSubtitle, 'sub');
    });

    testWidgets('Input text for Primary button', (tester) async {
      await tester.pumpWidget(page);
      await tester.enterText(
        find.widgetWithText(CustomizationItemsContainer, 'Primary button'),
        'primary',
      );
      expect(find.text('primary'), findsOneWidget);
      expect(textPrimaryButton, 'primary');
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
        find.widgetWithText(CustomizationItemsContainer, 'Secondary button'),
        'qq',
      );
      expect(find.text('qq'), findsOneWidget);
      expect(textSecondaryButton, 'qq');
    });
  });
}
