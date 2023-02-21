import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:survey_admin/presentation/app/localization/localizations.dart';
import 'package:survey_admin/presentation/utils/app_fonts.dart';
import 'package:survey_admin/presentation/utils/asset_strings.dart';
import 'package:survey_admin/presentation/utils/colors.dart';
import 'package:survey_admin/presentation/utils/constants/constants.dart';

class SurveyContentBar extends StatelessWidget {
  const SurveyContentBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppDimensions.surveyContentBarWidth,
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
                Text(
                  context.localization.survey,
                  style: const TextStyle(
                    color: AppColors.text,
                    fontWeight: AppFonts.weightBold,
                  ),
                ),
                const SizedBox(
                  width: AppDimensions.margin3XL + AppDimensions.margin2XL,
                ),
                SizedBox(
                  height: AppDimensions.size3M,
                  width: AppDimensions.size3M,
                  child: SvgPicture.asset(AssetStrings.addCircle),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
