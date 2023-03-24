import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:survey_core/survey_core.dart'; //import the library

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      // Add localization to your app.
      localizationsDelegates: const [AppLocalizations.delegate],
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Survey example'),
      ),
      // Add Survey to your widget tree with filePath parameter that accepts
      // a json file with parsed survey data
      body: const Survey(filePath: 'assets/questions.json'),
    );
  }
}
