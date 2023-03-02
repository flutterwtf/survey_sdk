import 'package:flutter/cupertino.dart';
import 'package:survey_admin/presentation/utils/app_text_styles.dart';

// TODO(dev): Why is this class in a separate folder?
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
      style: AppTextStyles.interMSemiBold,
    );
  }
}
