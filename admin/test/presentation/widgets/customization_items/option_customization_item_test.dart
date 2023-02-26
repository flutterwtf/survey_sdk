import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:survey_admin/presentation/widgets/customization_items/customization_text_field.dart';
import 'package:survey_admin/presentation/widgets/customization_items/option_customization_item.dart';

void main() {
  group('option customization item ->', () {
    testWidgets('OptionCustomizationItem adds new option when text is entered',
        (WidgetTester tester) async {
      List<String> options = ['Option 1', 'Option 2'];
      await tester.pumpWidget(
        MaterialApp(
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
          ],
          home: Scaffold(
            body: OptionCustomizationItem(
              options: options,
              onChanged: (newOptions) {
                options = newOptions;
              },
            ),
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
    });

    testWidgets(
        'OptionCustomizationItem deletes option when delete button is pressed',
        (WidgetTester tester) async {
      List<String> options = ['Option 1', 'Option 2', 'Option 3'];
      await tester.pumpWidget(
        MaterialApp(
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
          ],
          home: Scaffold(
            body: OptionCustomizationItem(
              options: options,
              onChanged: (newOptions) {
                options = newOptions;
              },
            ),
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
    });
  });
}