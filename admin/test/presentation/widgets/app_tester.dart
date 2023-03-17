import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

//The helper class cannot be named *_test.dart because the test runner
// relies on this template and tries to execute the main() method
class AppTester extends StatelessWidget {
  final Widget child;
  final List<NavigatorObserver> navigatorObservers;

  const AppTester({
    required this.child,
    this.navigatorObservers = const [],
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
      ],
      home: Scaffold(
        body: child,
      ),
    );
  }
}
