import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:survey_sdk/presentation/utils/asset_strings.dart';
import 'package:survey_sdk/presentation/utils/colors.dart';
import 'package:survey_sdk/presentation/utils/constants/constants.dart';

class PhoneView extends StatelessWidget {
  const PhoneView({super.key});

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: AppColors.greyBackground,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(AppDimensions.size2M),
          child: SvgPicture.asset(AssetStrings.iphone),
        ),
      ),
    );
  }
}
