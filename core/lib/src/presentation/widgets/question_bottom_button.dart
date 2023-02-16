import 'package:core/src/presentation/utils/app_fonts.dart';
import 'package:core/src/presentation/utils/constants.dart';
import 'package:flutter/material.dart';

class QuestionBottomButton extends StatelessWidget {
  const QuestionBottomButton({
    super.key,
    required this.text,
    required this.onPressed,
    required this.isEnabled,
    required this.animatedColorOpacity,
  });

  final String text;
  final VoidCallback onPressed;
  final bool isEnabled;
  final double animatedColorOpacity;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      //TODO: let the widget define it's own height depending on the child
      height: 52,
      width: double.infinity,
      child: Material(
        color: Colors.black.withOpacity(animatedColorOpacity),
        borderRadius: BorderRadius.circular(
          AppDimensions.circularRadiusS,
        ),
        child: InkWell(
          onTap: isEnabled ? onPressed : null,
          borderRadius: BorderRadius.circular(
            AppDimensions.circularRadiusS,
          ),
          child: Center(
            child: Text(
              text,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: AppFonts.weightBold,
                fontSize: AppFonts.sizeM,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
