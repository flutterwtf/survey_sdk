import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:survey_admin/presentation/widgets/customization_items/customization_items_container.dart';
import 'package:survey_admin/presentation/widgets/customization_panel/choice/choice_content_customization_tab.dart';
import 'package:survey_client/survey_client.dart';

import '../app_tester.dart';

// TODO(dev): add test for choice rule
void main() {
  group(
    'Choice content customization tab tests',
    () {
      var data = const ChoiceQuestionData.common();
      final page = AppTester(
        child: ChoiceContentCustomizationTab(
          title: 'Content',
          onChange: (QuestionData<dynamic> newData) {
            data = newData as ChoiceQuestionData;
          },
          editable: data,
        ),
      );

      testWidgets(
        'All content widget test',
        (widgetTester) async {
          await widgetTester.pumpWidget(page);
          await widgetTester.pumpAndSettle();
          expect(
            find.widgetWithText(CustomizationItemsContainer, 'Title'),
            findsWidgets,
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
          expect(data.title, 'title text');
          expect(find.text('title text'), findsOneWidget);
        },
      );

      testWidgets(
        'Try to change a subtitle',
        (tester) async {
          await tester.pumpWidget(page);
          await tester.pumpAndSettle();

          await tester.enterText(find.byType(TextField).at(1), 'subtitle text');
          expect(data.subtitle, 'subtitle text');
          expect(find.text('subtitle text'), findsOneWidget);
        },
      );

      testWidgets(
        'Try to change options',
        (tester) async {
          await tester.pumpWidget(page);
          await tester.pumpAndSettle();

          final optionsInputField = find.byType(TextFormField).at(2);

          // Enter first option
          await tester.enterText(optionsInputField, 'first');
          await tester.pump();
          expect(find.text('first'), findsOneWidget);
          expect(
            data.options,
            const [
              'First option',
              'Second option',
              'Third option',
            ],
          );

          // Click done
          await tester.testTextInput.receiveAction(TextInputAction.done);
          await tester.pump();
          expect(find.text('first'), findsOneWidget);
          expect(
            data.options,
            const [
              'First option',
              'Second option',
              'Third option',
              'first',
            ],
          );

          // Add second option
          await tester.enterText(optionsInputField, 'second');
          await tester.testTextInput.receiveAction(TextInputAction.done);
          await tester.pump();
          expect(find.text('first'), findsOneWidget);
          expect(find.text('second'), findsOneWidget);
          expect(
            data.options,
            const [
              'First option',
              'Second option',
              'Third option',
              'first',
              'second',
            ],
          );

          // Remove first option
          await tester.tap(find.byType(IconButton).first);
          await tester.pump();
          expect(find.text('second'), findsOneWidget);
          expect(
            data.options,
            const [
              'Second option',
              'Third option',
              'first',
              'second',
            ],
          );
        },
      );
    },
  );
}
