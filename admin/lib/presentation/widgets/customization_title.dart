import 'package:flutter/material.dart';
import 'package:survey_admin/presentation/utils/app_fonts.dart';
import 'package:survey_admin/presentation/utils/theme_extension.dart';

// TODO(dev): Do we really need this widget?
class CustomizationTitle extends StatelessWidget {
  final String title;

  const CustomizationTitle({
    required this.title,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        title,
        style: context.theme.textTheme.titleSmall?.copyWith(
          fontWeight: AppFonts.weightBold,
        ),
      ),
    );
  }
}
