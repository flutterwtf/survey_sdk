import 'package:flutter/material.dart';

abstract class CustomizationTab extends StatelessWidget {
  final String title;

  const CustomizationTab({
    required this.title,
    super.key,
  });
}
