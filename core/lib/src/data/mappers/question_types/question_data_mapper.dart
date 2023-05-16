import 'package:flutter/material.dart';

abstract class QuestionDataMapper<T> {
  T fromJson(Map<String, dynamic> json);
  Map<String, dynamic> toJson(T data, {ThemeExtension<dynamic>? commonTheme});
}
