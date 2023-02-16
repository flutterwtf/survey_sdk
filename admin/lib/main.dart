import 'package:flutter/material.dart';
import 'package:survey_sdk/presentation/app/app.dart';
import 'package:survey_sdk/presentation/app/di/injector.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  initInjector();
  runApp(const Material(child: App()));
}
