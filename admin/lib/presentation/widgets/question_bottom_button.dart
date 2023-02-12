import 'package:flutter/material.dart';
import 'package:survey_sdk/presentation/utils/app_fonts.dart';

import 'package:survey_sdk/presentation/utils/constants/constants.dart';

import 'package:survey_sdk/presentation/utils/colors.dart';

class QuestionBottomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final bool isEnabled;

  const QuestionBottomButton({
    super.key,
    required this.text,
    required this.onPressed,
    required this.isEnabled,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isEnabled ? onPressed : null,
      child: Container(
        height: 52,
        decoration: BoxDecoration(
          color: AppColors.black,
          borderRadius: BorderRadius.circular(
            AppDimensions.circularRadiusS,
          ),
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
    );
  }
}
