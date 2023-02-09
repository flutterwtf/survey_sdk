import 'package:flutter/material.dart';

abstract class TypeQuestion {
  final String title;
  final String subtitle;
  final String? info;
  final String typeQuestion;
  final bool isSkip;
  final dynamic payload;

  TypeQuestion({
    required this.title,
    required this.subtitle,
    required this.typeQuestion,
    required this.isSkip,
    this.info,
    this.payload,
  });

  Theme get theme;
  String get type;
}
