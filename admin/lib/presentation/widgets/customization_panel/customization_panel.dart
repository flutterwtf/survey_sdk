import 'package:flutter/material.dart';

// ignore: lines_longer_than_80_chars
// TODO(dev): We should highlight this class. Maybe create separate `base` folder for this and add documentation for this class
abstract class CustomizationPanel extends StatelessWidget {
  final String title;

  const CustomizationPanel({
    required this.title,
    super.key,
  });
}
