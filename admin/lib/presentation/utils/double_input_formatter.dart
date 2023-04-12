import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DoubleInputFormatter extends TextInputFormatter {
  static final doubleRegExp = RegExp(r'^\d{1,2}\.?\d{0,2}$');
  static const digitsBeforeDot = 2;

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    //Trim leading zero
    var newTrimmed = newValue.text.isNotEmpty && newValue.text[0] == '0'
        ? newValue.text.characters.getRange(1).toString()
        : newValue.text;

    // allow only numbers that are less than 100
    newTrimmed = newTrimmed.contains('.')
        ? newTrimmed
        : newTrimmed.characters
            .getRange(0, min(digitsBeforeDot, newTrimmed.length))
            .toString();

    final outText = _calculateOutText(oldValue.text, newTrimmed);
    final selection = _calculateTextOffset(oldValue, outText);
    return TextEditingValue(text: outText, selection: selection);
  }

  String _calculateOutText(String oldText, String newText) {
    return newText.isEmpty
        ? '0'
        : doubleRegExp.hasMatch(newText)
            ? newText
            : oldText;
  }

  TextSelection _calculateTextOffset(
    TextEditingValue oldValue,
    String outText,
  ) {
    final oldSelectionOffset = oldValue.selection.baseOffset;
    final offset = outText.length - oldValue.text.length;
    return TextSelection.collapsed(offset: oldSelectionOffset + offset);
  }
}
