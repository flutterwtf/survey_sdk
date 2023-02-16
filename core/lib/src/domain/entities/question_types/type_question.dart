import 'package:flutter/material.dart';

abstract class TypeQuestion {
  final String title;
  final String subtitle;
  final String? info;
  final String typeQuestion;
  final bool isSkip;
  final Map<String, dynamic> payload;

  const TypeQuestion({
    required this.title,
    required this.subtitle,
    required this.typeQuestion,
    required this.isSkip,
    required this.payload,
    this.info,
  });

  Theme get theme;
  String get type;
}
