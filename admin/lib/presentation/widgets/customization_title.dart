import 'package:flutter/material.dart';
import 'package:survey_admin/presentation/utils/app_fonts.dart';

class CustomizationTitle extends StatelessWidget {
  final String title;

  const CustomizationTitle({
    Key? key,
    required this.title,
  }) : super(key: key);

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
