import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:survey_admin/presentation/widgets/customization_items/customization_items_container.dart';
import 'package:survey_admin/presentation/widgets/customization_panel/choice/choice_content_customization_tab.dart';
import 'package:survey_admin/presentation/widgets/customization_panel/choice/choice_customization_panel.dart';
import 'package:survey_core/survey_core.dart';

import '../app_tester.dart';

void main() {
  group(
    'Choice content customization tab tests',
    () {
      var options = <String>[];
      var title = '';
      var subtitle = '';
      final page = AppTester(
        child: ChoiceContentCustomizationTab(
          title: 'Content',
          onOptionsChanged: (newOptions) => options = newOptions,
          onSubTitleChanged: (newSubtitle) => subtitle = newSubtitle,
          onTitleChanged: (newTitle) => title = newTitle,
          onRuleChanged: (value) {},
          ruleType: RuleType.none,
          ruleValue: 0,
          listOptions: const [],
          onRuleLimitedChanged: (value) {},
          editableQuestion: const IntroQuestionData.common(),
        ),
      );

      testWidgets(
        'All content widget test',
        (widgetTester) async {
          await widgetTester.pumpWidget(page);
          await widgetTester.pumpAndSettle();
          expect(
            find.widgetWithText(CustomizationItemsContainer, 'Title'),
            findsOneWidget,
          );
          expect(
            find.widgetWithText(CustomizationItemsContainer, 'Subtitle'),
            findsOneWidget,
          );
          expect(
            find.widgetWithText(CustomizationItemsContainer, 'Options'),
            findsOneWidget,
          );
        },
      );

      testWidgets(
        'Try to change a title',
        (tester) async {
          await tester.pumpWidget(page);
          await tester.pumpAndSettle();

          await tester.enterText(find.byType(TextField).first, 'title text');
          expect(title, 'title text');
          expect(find.text('title text'), findsOneWidget);
        },
      );

      testWidgets(
        'Try to change a subtitle',
        (tester) async {
          await tester.pumpWidget(page);
          await tester.pumpAndSettle();

          await tester.enterText(find.byType(TextField).at(1), 'subtitle text');
          expect(subtitle, 'subtitle text');
          expect(find.text('subtitle text'), findsOneWidget);
        },
      );

      testWidgets(
        'Try to change options',
        (tester) async {
          await tester.pumpWidget(page);
          await tester.pumpAndSettle();

          final optionsInputField = find.byType(TextFormField);

          // Enter first option
          await tester.enterText(optionsInputField, 'first');
          await tester.pump();
          expect(find.text('first'), findsOneWidget);
          expect(options, []);

          // Click done
          await tester.testTextInput.receiveAction(TextInputAction.done);
          await tester.pump();
          expect(find.text('first'), findsOneWidget);
          expect(options, ['first']);

          // Add second option
          await tester.enterText(optionsInputField, 'second');
          await tester.testTextInput.receiveAction(TextInputAction.done);
          await tester.pump();
          expect(find.text('first'), findsOneWidget);
          expect(find.text('second'), findsOneWidget);
          expect(options, ['first', 'second']);

          // Remove first option
          await tester.tap(find.byType(IconButton).first);
          await tester.pump();
          expect(find.text('second'), findsOneWidget);
          expect(options, ['second']);
        },
      );
    },
  );
}
