import 'package:flutter/material.dart';
import 'package:survey_sdk/presentation/utils/app_fonts.dart';
import 'package:survey_sdk/presentation/utils/colors.dart';
import 'package:survey_sdk/presentation/utils/constants/constants.dart';

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
      height: 52,
      width: double.infinity,
      child: Material(
        color: AppColors.black.withOpacity(animatedColorOpacity),
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
                color: AppColors.white,
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
