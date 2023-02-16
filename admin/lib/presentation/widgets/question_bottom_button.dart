import 'package:flutter/material.dart';
import 'package:survey_sdk/presentation/utils/app_fonts.dart';
import 'package:survey_sdk/presentation/utils/colors.dart';
import 'package:survey_sdk/presentation/utils/constants/constants.dart';

class QuestionBottomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final bool isEnabled;
  final bool isMain;

  const QuestionBottomButton({
    super.key,
    required this.text,
    required this.onPressed,
    required this.isEnabled,
    required this.isMain,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isEnabled ? onPressed : null,
      child: Container(
        height: 52,
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: isMain ? AppColors.black : AppColors.white,
          borderRadius: BorderRadius.circular(
            AppDimensions.circularRadiusS,
          ),
          border: Border.all(color: AppColors.black),
        ),
        child: Center(
          child: Text(
              text,
              style: TextStyle(
                color: isMain ? AppColors.white : AppColors.black,
                fontWeight: AppFonts.weightBold,
                fontSize: AppFonts.sizeM,
              ),
            ),
        ),
        ),
    );
  }
}
