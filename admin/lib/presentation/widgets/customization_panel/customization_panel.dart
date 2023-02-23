import 'package:flutter/material.dart';

abstract class CustomizationPanel extends StatelessWidget {
  final String title;

  const CustomizationPanel({
    super.key,
    required this.title,
  });
}
