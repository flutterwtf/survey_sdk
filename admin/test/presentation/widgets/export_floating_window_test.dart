import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:survey_admin/presentation/widgets/export_floating_window.dart';

void main() {
  final closeCompleter = Completer<void>();
  final downloadCompleter = Completer<void>();
  final copyCompleter = Completer<void>();

  final exportFloatingWindow = MaterialApp(
    supportedLocales: AppLocalizations.supportedLocales,
    localizationsDelegates: const [
      AppLocalizations.delegate,
      GlobalMaterialLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate,
      GlobalCupertinoLocalizations.delegate,
    ],
    home: Material(
      child: ExportFloatingWindow(
        onClosePressed: closeCompleter.complete,
        onDownloadPressed: downloadCompleter.complete,
        onCopyPressed: copyCompleter.complete,
      ),
    ),
  );

  group('Export floating window test', () {
    testWidgets(
      'open window, initialization',
      (tester) async {
        await tester.pumpWidget(exportFloatingWindow);
        await tester.pumpAndSettle();

        expect(
          find.byType(FilledButton),
          findsNWidgets(2),
        );
      },
    );

    testWidgets(
      'press `close`, `copy` and `download` buttons',
      (tester) async {
        await tester.pumpWidget(exportFloatingWindow);
        await tester.pumpAndSettle();

        await tester.tap(find.text('COPY'));
        await tester.tap(find.text('DOWNLOAD'));
        await tester.tap(find.byType(IconButton));

        expect(downloadCompleter.isCompleted, true);
        expect(copyCompleter.isCompleted, true);
        expect(closeCompleter.isCompleted, true);
      },
    );
  });
}
