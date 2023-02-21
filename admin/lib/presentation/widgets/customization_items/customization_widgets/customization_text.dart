import 'package:flutter/cupertino.dart';
import 'package:survey_admin/presentation/utils/app_fonts.dart';

class CustomizationText extends StatelessWidget {
  final String text;

  const CustomizationText(
    this.text, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: AppFonts.sizeM,
        fontWeight: AppFonts.weightSemiBold,
      ),
    );
  }
}
