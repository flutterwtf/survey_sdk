import 'package:flutter/material.dart';
import 'package:survey_sdk/src/presentation/utils/utils.dart';

class QuestionBottomButton extends StatelessWidget {
  /// Text displayed on the button.
  final String text;

  /// Background color of the button.
  final Color? color;

  /// Text color of the button.
  final Color? textColor;

  /// Font size of the button text.
  final double? textSize;

  /// Border radius of the button.
  final double? radius;

  /// The callback function called when the button is pressed.
  final VoidCallback? onPressed;

  /// Determines if the button is enabled and can be pressed.
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
        (color ?? SurveyColors.black).withOpacity(isEnabled ? 1.0 : 0.6);
    final buttonTextColor =
        (textColor ?? SurveyColors.white).withOpacity(isEnabled ? 1.0 : 0.6);
    return SizedBox(
      width: double.infinity,
      child: InkWell(
        onTap: isEnabled ? onPressed : null,
        borderRadius: BorderRadius.circular(
          radius ?? SurveyDimensions.circularRadiusXS,
        ),
        child: AnimatedContainer(
          decoration: BoxDecoration(
            color: buttonColor,
            borderRadius: BorderRadius.circular(
              radius ?? SurveyDimensions.circularRadiusXS,
            ),
            border: Border.all(color: buttonColor),
          ),
          duration: SurveyDurations.questionBottomButton,
          child: Padding(
            padding: const EdgeInsets.all(SurveyDimensions.marginS),
            child: Center(
              child: Text(
                text,
                style: TextStyle(
                  color: buttonTextColor,
                  fontWeight: SurveyFonts.weightBold,
                  fontSize: textSize ?? SurveyFonts.sizeM,
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
