import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:survey_admin/presentation/widgets/customization_items/customization_widgets/customization_text_field.dart';
import 'package:survey_admin/presentation/widgets/customization_items/option_customization_item.dart';

import '../app_tester.dart';

void main() {
  group('option customization item ->', () {
    testWidgets(
      'OptionCustomizationItem adds new option when text is entered',
      (WidgetTester tester) async {
        var options = <String>['Option 1', 'Option 2'];
        var ruleValue = 0;
        await tester.pumpWidget(
          AppTester(
            child: OptionCustomizationItem(
              options: options,
              ruleValue: ruleValue,
              onChanged: (newOptions) {
                options = newOptions;
              },
              onRuleValueChanged: (newRuleValue) {
                ruleValue = newRuleValue;
              },
            ),
          ),
        );

        expect(find.text('Option 1'), findsOneWidget);
        expect(find.text('Option 2'), findsOneWidget);

        await tester.enterText(find.byType(CustomizationTextField), 'Option 3');
        await tester.testTextInput.receiveAction(TextInputAction.done);
        await tester.pump();

        expect(options.length, 3);
        expect(find.text('Option 3'), findsOneWidget);
      },
    );

    testWidgets(
      'OptionCustomizationItem deletes option when delete button is pressed',
      (WidgetTester tester) async {
        var options = <String>['Option 1', 'Option 2', 'Option 3'];
        var ruleValue = 0;
        await tester.pumpWidget(
          AppTester(
            child: OptionCustomizationItem(
              options: options,
              ruleValue: ruleValue,
              onChanged: (newOptions) {
                options = newOptions;
              },
              onRuleValueChanged: (newRuleValue) {
                ruleValue = newRuleValue;
              },
            ),
          ),
        );

        expect(find.text('Option 1'), findsOneWidget);
        expect(find.text('Option 2'), findsOneWidget);
        expect(find.text('Option 3'), findsOneWidget);

        await tester.tap(find.widgetWithIcon(IconButton, Icons.close).last);
        await tester.pump();

        expect(options.length, 2);
        expect(find.text('Option 1'), findsOneWidget);
        expect(find.text('Option 2'), findsOneWidget);
        expect(find.text('Option 3'), findsNothing);
      },
    );

    testWidgets(
      'Delete option and change ruleValue when ruleValue = last value',
      (WidgetTester tester) async {
        var options = <String>['Option 1', 'Option 2', 'Option 3'];
        var ruleValue = 3;
        await tester.pumpWidget(
          AppTester(
            child: OptionCustomizationItem(
              options: options,
              ruleValue: ruleValue,
              onChanged: (newOptions) {
                options = newOptions;
              },
              onRuleValueChanged: (newRuleValue) {
                ruleValue = newRuleValue;
              },
            ),
          ),
        );

        expect(find.text('Option 3'), findsOneWidget);

        await tester.tap(find.widgetWithIcon(IconButton, Icons.close).last);
        await tester.pump();

        expect(ruleValue, 0);
        expect(find.text('Option 3'), findsNothing);
      },
    );
  });
}
