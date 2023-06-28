import 'package:flutter/services.dart';

class MaxValueFormatter extends TextInputFormatter {
  final int maxValue;

  MaxValueFormatter(this.maxValue);

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    final parsedValue = int.tryParse(newValue.text);

    if (parsedValue != null && parsedValue <= maxValue && parsedValue != 0) {
      return newValue;
    }

    if (newValue.text.length < oldValue.text.length) {
      return newValue;
    }

    return oldValue;
  }
}
