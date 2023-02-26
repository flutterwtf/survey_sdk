import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:survey_admin/presentation/widgets/customization_items/divisions_customization_item.dart';

void main() {
  group('Division customization item widget', () {
    testWidgets('load widget', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          localizationsDelegates: const [
            AppLocalizations.delegate,
          ],
          home: Scaffold(
            body: DivisionsCustomizationItem(
              initialValue: 10,
              onChanged: (int? divisions) {},
            ),
          ),
        ),
      );
      expect(find.byType(DivisionsCustomizationItem), findsOneWidget);
      expect(find.text('10'), findsOneWidget);
    });

    testWidgets('erase first then second initial characters', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          localizationsDelegates: const [
            AppLocalizations.delegate,
          ],
          home: Scaffold(
            body: DivisionsCustomizationItem(
              initialValue: 11,
              onChanged: (int? divisions) => divisions,
            ),
          ),
        ),
      );
      expect(find.text('11'), findsOneWidget);
      await tester.tap(find.byType(DivisionsCustomizationItem));
      await tester.sendKeyEvent(LogicalKeyboardKey.backspace);
      await tester.pump();
      expect(find.text('11'), findsNothing);
      expect(find.text('1'), findsOneWidget);
      await tester.tap(find.byType(DivisionsCustomizationItem));
      await tester.sendKeyEvent(LogicalKeyboardKey.backspace);
      await tester.pump();
      expect(find.text('11'), findsNothing);
      expect(find.text('1'), findsNothing);
    });

    testWidgets('erase and enter new value (1 character)', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          localizationsDelegates: const [
            AppLocalizations.delegate,
          ],
          home: Scaffold(
            body: DivisionsCustomizationItem(
              initialValue: 2,
              onChanged: (int? divisions) => divisions,
            ),
          ),
        ),
      );
      await tester.tap(find.byType(DivisionsCustomizationItem));
      await tester.sendKeyEvent(LogicalKeyboardKey.backspace);
      await tester.enterText(find.byType(FormBuilderTextField), '1');
      await tester.pump();
      expect(find.text('1'), findsOneWidget);
    });

    testWidgets('erase and enter new characters (total > 3)', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          localizationsDelegates: const [
            AppLocalizations.delegate,
          ],
          home: Scaffold(
            body: DivisionsCustomizationItem(
              initialValue: 2,
              onChanged: (int? divisions) => divisions,
            ),
          ),
        ),
      );
      await tester.tap(find.byType(DivisionsCustomizationItem));
      await tester.sendKeyEvent(LogicalKeyboardKey.backspace);
      await tester.enterText(find.byType(FormBuilderTextField), '3331');
      await tester.pump();
      expect(find.text('333'), findsOneWidget);
      expect(find.text('3331'), findsNothing);
      expect(find.textContaining('1'), findsNothing);
    });

    testWidgets('5 initial characters and erase 1', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          localizationsDelegates: const [
            AppLocalizations.delegate,
          ],
          home: Scaffold(
            body: DivisionsCustomizationItem(
              initialValue: 22222,
              onChanged: (int? divisions) => divisions,
            ),
          ),
        ),
      );
      await tester.tap(find.byType(DivisionsCustomizationItem));
      await tester.sendKeyEvent(LogicalKeyboardKey.backspace);
      await tester.pump();
      expect(find.text('222'), findsOneWidget);
      expect(find.text('2222'), findsNothing);
    });
  });
}
