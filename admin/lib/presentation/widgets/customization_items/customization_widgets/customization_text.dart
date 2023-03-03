import 'package:flutter/cupertino.dart';
import 'package:survey_admin/presentation/utils/app_fonts.dart';

// TODO(dev): Why is this class in a separate folder?
class CustomizationText extends StatelessWidget {
  final String text;

  const CustomizationText(
    this.text, {
    super.key,
  });

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
