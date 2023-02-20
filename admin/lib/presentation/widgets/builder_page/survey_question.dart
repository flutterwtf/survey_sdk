import 'package:flutter/material.dart';
import 'package:survey_sdk/presentation/utils/app_fonts.dart';
import 'package:survey_sdk/presentation/utils/colors.dart';
import 'package:survey_sdk/presentation/utils/constants/constants.dart';

class SurveyQuestion extends StatelessWidget {
  final int index;
  final String title;

  const SurveyQuestion({
    required this.index,
    required this.title,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Padding(
        padding: const EdgeInsets.all(AppDimensions.margin2XS),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: AppDimensions.marginS),
              child: Text(
                index.toString(),
                style: const TextStyle(
                  color: AppColors.textGrey,
                  fontSize: AppFonts.sizeS,
                ),
              ),
            ),
            const SizedBox(width: AppDimensions.marginS),
            Container(
              decoration: const BoxDecoration(
                color: AppColors.switchBackgroundActive,
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              height: 40,
              width: 40,
            ),
            const SizedBox(width: AppDimensions.marginS),
            Text(title),
          ],
        ),
      ),
    );
  }
}
