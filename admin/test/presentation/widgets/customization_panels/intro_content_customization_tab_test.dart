import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:survey_admin/presentation/widgets/customization_items/customization_items_container.dart';
import 'package:survey_admin/presentation/widgets/customization_panel/info/info_content_customization_tab.dart';
import 'package:survey_sdk/survey_sdk.dart';

import '../app_tester.dart';

void main() {
  group('Tests for IntroContentCustomizationTab', () {
    var data = const InfoQuestionData.common();

    final page = AppTester(
      child: InfoContentCustomizationTab(
        title: 'Content',
        onChange: (QuestionData<dynamic> newData) {
          data = newData as InfoQuestionData;
        },
        editable: data,
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
      expect(data.title, 'Intro');
    });

    testWidgets('Input text for Subtitle', (tester) async {
      await tester.pumpWidget(page);
      await tester.enterText(
        find.widgetWithText(CustomizationItemsContainer, 'Subtitle'),
        'sub',
      );
      expect(find.text('sub'), findsOneWidget);
      expect(data.subtitle, 'sub');
    });

    testWidgets('Input text for Primary button', (tester) async {
      await tester.pumpWidget(page);
      await tester.enterText(
        find.widgetWithText(CustomizationItemsContainer, 'Primary button'),
        'primary',
      );
      expect(find.text('primary'), findsOneWidget);
      expect(data.primaryButtonText, 'primary');
    });

    testWidgets('Unlock Secondary button', (tester) async {
      await tester.pumpWidget(page);
      await tester.tap(find.byType(InkWell));
      await tester.pump();
      expect(data.isSkip, isTrue);
    });

    testWidgets('Lock Secondary button', (tester) async {
      await tester.pumpWidget(page);
      await tester.tap(find.byType(InkWell));
      await tester.pump();
      await tester.tap(find.byType(InkWell));
      await tester.pump();
      expect(data.isSkip, isFalse);
    });
  });
}
