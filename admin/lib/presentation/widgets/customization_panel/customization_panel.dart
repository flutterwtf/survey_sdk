import 'package:flutter/material.dart';

// TODO(dev): We should highlight this class. Maybe create separate `base` folder for this and add documentation for this class
abstract class CustomizationPanel extends StatelessWidget {
  final String title;

  const CustomizationPanel({
    super.key,
    required this.title,
  });
}
