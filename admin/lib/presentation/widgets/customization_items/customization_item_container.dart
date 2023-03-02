import 'package:flutter/material.dart';
import 'package:survey_admin/presentation/utils/app_fonts.dart';

class CustomizationItemContainer extends StatelessWidget {
  final bool isFontBold;
  final String text;

  const CustomizationItemContainer({super.key, required this.text, this.isFontBold = false});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: AppFonts.sizeM,
        fontWeight: isFontBold ? AppFonts.weightBold : AppFonts.weightSemiBold,
      ),
    );
  }
}
