import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:survey_admin/presentation/widgets/customization_items/multiple_choice_customization_item.dart';

import '../app_tester.dart';

void main() {
  group('MultipleChoiceCustomizationItem ->', () {
    testWidgets(
      'Option delete element',
      (WidgetTester tester) async {
        var isMultipleChoice = false;
        await tester.pumpWidget(
          AppTester(
            child: MultipleChoiceCustomizationItem(
              value: isMultipleChoice,
              onChanged: (value) => isMultipleChoice = value,
            ),
          ),
        );

        await tester.tap(find.byType(AnimatedContainer));
        await tester.pump();

        expect(isMultipleChoice, true);
      },
    );
  });
}
