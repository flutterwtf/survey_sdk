import 'dart:convert';

import 'package:flutter/services.dart';

Future<void> copyJson(Map<String, dynamic> jsonObject) async {
  final jsonText = jsonEncode(jsonObject);
  await Clipboard.setData(ClipboardData(text: jsonText));
}
