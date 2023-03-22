import 'dart:convert';

import 'package:flutter/services.dart';

//ignore: prefer-static-class
Future<void> copyJson(Map<String, dynamic> jsonObject) async {
  final jsonText = jsonEncode(jsonObject);
  await Clipboard.setData(ClipboardData(text: jsonText));
}
