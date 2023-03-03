import 'package:flutter/material.dart';
import 'package:survey_core/src/presentation/utils/app_duration.dart';
import 'package:survey_core/src/presentation/utils/app_fonts.dart';
import 'package:survey_core/src/presentation/utils/colors.dart';
import 'package:survey_core/src/presentation/utils/constants.dart';

class QuestionBottomButton extends StatelessWidget {
  final String text;
  final Color? color;
  final Color? textColor;
  final double? textSize;
  final double? radius;
  final VoidCallback onPressed;
  final bool isEnabled;

  const QuestionBottomButton({
    required this.text,
    required this.onPressed,
    this.isEnabled = true,
    this.color,
    this.textColor,
    this.textSize,
    this.radius,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final buttonColor =
        (color ?? AppColors.black).withOpacity(isEnabled ? 1.0 : 0.6);
    final buttonTextColor =
        (textColor ?? AppColors.white).withOpacity(isEnabled ? 1.0 : 0.6);
    return SizedBox(
      width: double.infinity,
      child: InkWell(
        key: const Key('QBB'),
        onTap: isEnabled ? onPressed : null,
        borderRadius: BorderRadius.circular(
          radius ?? AppDimensions.circularRadiusXS,
        ),
        child: AnimatedContainer(
          decoration: BoxDecoration(
            color: buttonColor,
            borderRadius: BorderRadius.circular(
              radius ?? AppDimensions.circularRadiusXS,
            ),
            border: Border.all(color: buttonColor),
          ),
          duration: const Duration(milliseconds: AppDuration.bottomAnimation),
          child: Padding(
            padding: const EdgeInsets.all(AppDimensions.marginS),
            child: Center(
              child: Text(
                text,
                style: TextStyle(
                  color: buttonTextColor,
                  fontWeight: AppFonts.weightBold,
                  fontSize: textSize ?? AppFonts.sizeM,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
