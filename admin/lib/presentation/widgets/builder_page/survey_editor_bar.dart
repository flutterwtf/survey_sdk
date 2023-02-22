import 'package:flutter/material.dart';
import 'package:survey_admin/presentation/utils/colors.dart';
import 'package:survey_admin/presentation/utils/constants/constants.dart';

class SurveyEditorBar extends StatelessWidget {
  const SurveyEditorBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.whitePrimaryBackground,
      width: AppDimensions.surveyEditorBarWidth,
      child: SizedBox(
        child: Column(
          children: const [
            Divider(
              color: AppColors.greyBackground,
              thickness: 0.6,
              height: 1,
            ),
          ],
        ),
      ),
    );
  }
}
