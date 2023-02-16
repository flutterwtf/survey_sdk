import 'package:flutter/material.dart';
import 'package:survey_sdk/presentation/utils/app_fonts.dart';
import 'package:survey_sdk/presentation/utils/colors.dart';
import 'package:survey_sdk/presentation/utils/constants/constants.dart';

class SurveyQuestions extends StatelessWidget {
  const SurveyQuestions({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 210,
      color: AppColors.white,
      child: Column(
        children: [
          const Divider(
            color: AppColors.greyBackground,
            thickness: 0.6,
            height: 1,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: AppDimensions.margin2XS,
              horizontal: AppDimensions.marginLargeM,
            ),
            child: Row(
              children: [
                const Text(
                  'Survey',
                  style: TextStyle(
                    color: AppColors.text,
                    fontWeight: AppFonts.weightBold,
                  ),
                ),
                const SizedBox(
                  width: AppDimensions.margin3XL + AppDimensions.margin2XL,
                ),
                IconButton(
                  icon: const Icon(Icons.add_circle_outline),
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
