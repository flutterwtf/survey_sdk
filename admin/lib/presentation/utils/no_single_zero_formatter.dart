import 'package:flutter/services.dart';

class NoSingleZeroFormatter extends TextInputFormatter {
  const NoSingleZeroFormatter();

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    final parsedValue = int.tryParse(newValue.text);

    if (parsedValue != null && parsedValue != 0) {
      return newValue;
    }

    if (newValue.text.length < oldValue.text.length) {
      return newValue;
    }

    return oldValue;
  }
}
