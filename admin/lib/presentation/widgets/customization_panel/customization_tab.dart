import 'package:flutter/material.dart';

// TODO(dev): We should highlight this class. Maybe create
//  separate `base` folder for this and add documentation for this class.
abstract class CustomizationTab extends StatelessWidget {
  final String title;

  const CustomizationTab({
    required this.title,
    super.key,
  });
}
