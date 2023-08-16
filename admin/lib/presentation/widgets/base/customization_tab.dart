import 'package:flutter/material.dart';

abstract class CustomizationTab extends StatelessWidget {
  final String title;
  final bool showToolTip;

  const CustomizationTab({
    required this.title,
    this.showToolTip = false,
    super.key,
  });
}
