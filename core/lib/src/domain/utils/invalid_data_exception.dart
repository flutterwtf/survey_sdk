import 'package:flutter/cupertino.dart';

class InvalidDataException implements Exception {
  final String exception;
  final StackTrace stackTrace;
  final String? json;

  InvalidDataException(this.exception, this.stackTrace, this.json);

  @override
  String toString() {
    debugPrint('$stackTrace');
    return 'InvalidDataException: $exception\nStacktrace:\n$stackTrace';
  }

  String damagedJson() => json == null
      ? 'Json was not loaded. $exception'
      : 'Damaged JSON:\n$json';
}
