import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:survey_admin/presentation/widgets/customization_items/input_type_customization_item.dart';

void main() {
  group('Input type customization item widget', () {
    const text = 'Text';
    const date = 'Date';
    const number = 'Number';
    testWidgets('load widget with dif initial values', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          localizationsDelegates: const [
            AppLocalizations.delegate,
          ],
          home: Scaffold(
            body: InputTypeCustomizationItem(
              onChanged: (res) => res,
            ),
          ),
        ),
      );
      expect(find.byType(InputTypeCustomizationItem), findsOneWidget);
      expect(find.text(text), findsOneWidget);
    });

    testWidgets('tap and show all 3 items', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          localizationsDelegates: const [
            AppLocalizations.delegate,
          ],
          home: Scaffold(
            body: SizedBox(
              width: 400,
              height: 400,
              child: InputTypeCustomizationItem(
                initialValue: InputType.date,
                onChanged: (res) => res,
              ),
            ),
          ),
        ),
      );
      expect(find.text(date), findsOneWidget);
      await tester.tap(find.byType(Text));
      await tester.pump();
      expect(find.byType(Text), findsNWidgets(3));

      await tester.pump(const Duration(seconds: 1));
    });

    testWidgets('change item', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          localizationsDelegates: const [
            AppLocalizations.delegate,
          ],
          home: Scaffold(
            body: SizedBox(
              width: 400,
              height: 400,
              child: InputTypeCustomizationItem(
                initialValue: InputType.number,
                onChanged: (res) => res,
              ),
            ),
          ),
        ),
      );
      expect(find.text(number), findsOneWidget);

      await tester.tap(find.byType(Text));
      await tester.pump();
      await tester.tap(find.text(date), warnIfMissed: false);
      await tester.pump();
      expect(find.text(date), findsOneWidget);
      await tester.pump(const Duration(seconds: 1));
    });
  });
}
