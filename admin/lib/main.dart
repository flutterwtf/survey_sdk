import 'package:flutter/material.dart';
import 'package:survey_admin/presentation/app/app.dart';
import 'package:survey_admin/presentation/app/di/injector.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initInjector();
  runApp(const App());
}
