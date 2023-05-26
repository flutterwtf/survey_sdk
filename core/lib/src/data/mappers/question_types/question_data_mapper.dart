import 'package:flutter/material.dart';

abstract class QuestionDataMapper<T> {
  static int jsonVersion = 0;
  T fromJson(Map<String, dynamic> json);
  Map<String, dynamic> toJson(T data, {ThemeExtension<dynamic>? commonTheme});
}
