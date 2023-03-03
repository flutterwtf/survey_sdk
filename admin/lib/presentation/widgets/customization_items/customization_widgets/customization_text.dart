import 'package:flutter/cupertino.dart';
import 'package:survey_admin/presentation/utils/theme_extension.dart';

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
      style: context.theme.textTheme.titleSmall,
    );
  }
}
