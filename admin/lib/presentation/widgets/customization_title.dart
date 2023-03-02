import 'package:flutter/material.dart';
import 'package:survey_admin/presentation/utils/app_text_styles.dart';

// TODO(dev): Do we really need this widget?
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
        style: AppTextStyles.interMBold,
      ),
    );
  }
}
