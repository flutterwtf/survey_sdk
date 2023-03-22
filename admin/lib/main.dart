import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:survey_admin/presentation/app/app.dart';
import 'package:survey_admin/presentation/app/di/injector.dart';
import 'package:universal_html/html.dart';

void main() {
  if (kIsWeb) {
    window.document.onContextMenu.listen((evt) => evt.preventDefault());
  }
  WidgetsFlutterBinding.ensureInitialized();
  initInjector();
  runApp(const App());
}
