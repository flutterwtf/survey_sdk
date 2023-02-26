import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:survey_admin/presentation/widgets/customization_items/customization_widgets/customization_text_field.dart';
import 'package:survey_admin/presentation/widgets/customization_items/multiline_switch.dart';

void main() {
  group('Tests for MultilineSwitch', () {
    const title = 'Multiline';
    const buttonKey = Key('Switch');
    const inputNum = '12';
    const inputText = 'qwe';
    const inputTitle = 'Lines';
    final multilineSwitchPage = MaterialApp(
      supportedLocales: AppLocalizations.supportedLocales,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      home: Scaffold(
        body: MultilineSwitch(
          onChanged: (bool isMultiline, int lineAmount) {},
        ),
      ),
    );
    testWidgets('Load widget', (tester) async {
      await tester.pumpWidget(multilineSwitchPage);
      expect(find.text(title), findsOneWidget);
    });
    testWidgets('Open multiline input(tap on switch)', (tester) async {
      await tester.pumpWidget(multilineSwitchPage);
      await tester.tap(find.byKey(buttonKey));
      await tester.pump();
      expect(find.text(inputTitle), findsOneWidget);
    });
    testWidgets('Close multiline input(double tap on switch)', (tester) async {
      await tester.pumpWidget(multilineSwitchPage);
      await tester.tap(find.byKey(buttonKey));
      await tester.pump();
      await tester.tap(find.byKey(buttonKey));
      await tester.pump();
      expect(find.text(inputTitle), findsNothing);
    });
    testWidgets('Input count lines(num)', (tester) async {
      await tester.pumpWidget(multilineSwitchPage);
      await tester.tap(find.byKey(buttonKey));
      await tester.pump();
      await tester.enterText(find.byType(CustomizationTextField), inputNum);
      expect(find.text(inputNum), findsOneWidget);
    });
    testWidgets('Input count lines(not num)', (tester) async {
      await tester.pumpWidget(multilineSwitchPage);
      await tester.tap(find.byKey(buttonKey));
      await tester.pump();
      await tester.enterText(find.byType(CustomizationTextField), inputText);
      expect(find.text(inputText), findsNothing);
    });
    testWidgets('Check widget with parameters isMultiline = true', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          supportedLocales: AppLocalizations.supportedLocales,
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          home: Scaffold(
            body: MultilineSwitch(
              isMultiline: true,
              onChanged: (bool isMultiline, int lineAmount) {},
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();
      expect(find.text(inputTitle), findsOneWidget);
    });
  });
}
