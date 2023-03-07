import 'dart:html';
import 'package:flutter/material.dart';
import 'package:survey_admin/presentation/app/app.dart';
import 'package:survey_admin/presentation/app/di/injector.dart';

void main() async {
  window.document.onContextMenu.listen((evt) => evt.preventDefault());
  WidgetsFlutterBinding.ensureInitialized();
  await initInjector();
  runApp(const App());
}
