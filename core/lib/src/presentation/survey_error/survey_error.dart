import 'package:flutter/material.dart';
import 'package:survey_sdk/src/presentation/localization/survey_localizations_ext.dart';
import 'package:survey_sdk/src/presentation/utils/utils.dart';
import 'package:survey_sdk/src/presentation/widgets/question_bottom_button.dart';

class SurveyError extends StatelessWidget {
  final List<String> providedErrors;
  final VoidCallback onDetailsTap;
  final bool detailed;

  const SurveyError({
    required this.providedErrors,
    required this.onDetailsTap,
    required this.detailed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (detailed)
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(AppDimensions.marginS),
              children: [
                if (providedErrors.isNotEmpty) ...[
                  _SurveyErrorTitle(errorTitle: providedErrors.first),
                  Text(providedErrors.last),
                ],
              ],
            ),
          )
        else
          _SurveyErrorTitle(
            errorTitle: context.localization.surveyLoadError,
          ),
        Padding(
          padding: const EdgeInsets.all(AppDimensions.margin2XS),
          child: QuestionBottomButton(
            text: detailed
                ? context.localization.hideErrorDetails
                : context.localization.showErrorDetails,
            onPressed: onDetailsTap,
          ),
        ),
      ],
    );
  }
}

class _SurveyErrorTitle extends StatelessWidget {
  final String errorTitle;

  const _SurveyErrorTitle({required this.errorTitle, super.key});

  @override
  Widget build(BuildContext context) {
    // TODO(dev): May be we should to have text themes (h1, h2, etc.)
    return Padding(
      padding: const EdgeInsets.only(
        bottom: AppDimensions.margin2XS,
        top: AppDimensions.margin2XS,
      ),
      child: Text(
        errorTitle,
        style: const TextStyle(
          color: AppColors.black,
          fontWeight: AppFonts.weightBold,
          fontSize: AppFonts.sizeXL,
        ),
      ),
    );
  }
}
