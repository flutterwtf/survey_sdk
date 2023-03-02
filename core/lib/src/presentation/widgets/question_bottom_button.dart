import 'package:flutter/material.dart';
import 'package:survey_core/src/presentation/utils/app_duration.dart';
import 'package:survey_core/src/presentation/utils/app_fonts.dart';
import 'package:survey_core/src/presentation/utils/constants.dart';

class QuestionBottomButton extends StatelessWidget {
  const QuestionBottomButton({
    required this.text,
    required this.onPressed,
    this.isEnabled = true,
    this.isOutlined = false,
    super.key,
  });

  final String text;
  final VoidCallback onPressed;
  final bool isEnabled;
  final bool isOutlined;

  @override
  Widget build(BuildContext context) {
    final accentColor = Colors.black.withOpacity(isEnabled ? 1.0 : 0.6);
    return SizedBox(
      width: double.infinity,
      child: InkWell(
        key: const Key('QBB'),
        onTap: isEnabled ? onPressed : null,
        borderRadius: BorderRadius.circular(
          AppDimensions.circularRadiusXS,
        ),
        child: AnimatedContainer(
          decoration: BoxDecoration(
            color: isOutlined ? Colors.white : accentColor,
            borderRadius: BorderRadius.circular(
              AppDimensions.circularRadiusXS,
            ),
            border: Border.all(color: accentColor),
          ),
          duration: const Duration(milliseconds: AppDuration.bottomAnimation),
          child: Padding(
            padding: const EdgeInsets.all(AppDimensions.marginS),
            child: Center(
              child: Text(
                text,
                style: TextStyle(
                  color: isOutlined ? accentColor : Colors.white,
                  fontWeight: AppFonts.weightBold,
                  fontSize: AppFonts.sizeM,
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
