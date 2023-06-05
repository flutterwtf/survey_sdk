import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:survey_admin/presentation/widgets/customization_items/default_options_customization_item.dart';
import 'package:survey_admin/presentation/widgets/customization_items/dropdown_customization_button.dart';

import '../app_tester.dart';

void main() {
  group('DefaultOptionsCustomizationItem ->', () {
    const options = <String>['Option 1', 'Option 2', 'Option 3', 'Option 4'];

    testWidgets(
      'Add default options for single choice question',
      (WidgetTester tester) async {
        List<int>? defaultOptions = [0];
        await tester.pumpWidget(
          AppTester(
            child: DefaultOptionsCustomizationItem(
              options: options,
              defaultOptions: defaultOptions,
              isMultipleChoice: false,
              onChanged: (options) => defaultOptions = options,
            ),
          ),
        );

        await tester.tap(find.byType(DropdownCustomizationButton<int>));
        await tester.pumpAndSettle();
        await tester.tap(find.text(options[2]));
        await tester.pumpAndSettle();

        expect(defaultOptions, [2]);
      },
    );

    testWidgets(
      'Add default options for multiple choice question',
      (WidgetTester tester) async {
        List<int>? defaultOptions = [0];
        await tester.pumpWidget(
          AppTester(
            child: DefaultOptionsCustomizationItem(
              options: options,
              defaultOptions: defaultOptions,
              isMultipleChoice: true,
              onChanged: (options) => defaultOptions = options,
            ),
          ),
        );

        await tester.tap(find.byType(DropdownCustomizationButton<int>));
        await tester.pumpAndSettle();
        await tester.tap(find.text(options[2]));
        await tester.pumpAndSettle();

        expect(defaultOptions, [0, 2]);
      },
    );

    testWidgets(
      'Delete default options for multiple choice question',
      (WidgetTester tester) async {
        List<int>? defaultOptions = [0];
        await tester.pumpWidget(
          AppTester(
            child: DefaultOptionsCustomizationItem(
              options: options,
              defaultOptions: defaultOptions,
              isMultipleChoice: true,
              onChanged: (options) => defaultOptions = options,
            ),
          ),
        );


        await tester.tap(find.byType(IconButton));
        await tester.pumpAndSettle();

        expect(defaultOptions, []);
      },
    );
  });
}
