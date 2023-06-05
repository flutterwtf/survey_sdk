import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:survey_admin/presentation/widgets/customization_items/option.dart';

import '../app_tester.dart';

void main() {
  group('option ->', () {
    const optionValue = 'Option';
    testWidgets(
      'Option delete element',
      (WidgetTester tester) async {
        var isDeleted = false;
        await tester.pumpWidget(
          AppTester(
            child: Option(
              option: optionValue,
              onDelete: () => isDeleted = true,
            ),
          ),
        );

        expect(find.text(optionValue), findsOneWidget);

        await tester.tap(find.byType(IconButton));
        await tester.pump();

        expect(isDeleted, true);
      },
    );
  });
}
