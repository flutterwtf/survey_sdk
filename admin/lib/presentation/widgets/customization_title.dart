import 'package:flutter/material.dart';
import 'package:survey_admin/presentation/utils/app_fonts.dart';

// TODO(dev): Do we really need this widget?
class CustomizationTitle extends StatelessWidget {
  final String title;

  const CustomizationTitle({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        title,
        style: const TextStyle(
          fontSize: AppFonts.sizeM,
          fontWeight: AppFonts.weightBold,
        ),
      ),
    );
  }
}
