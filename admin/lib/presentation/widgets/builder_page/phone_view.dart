import 'package:flutter/material.dart';
import 'package:survey_sdk/presentation/utils/colors.dart';
import 'package:survey_sdk/presentation/utils/constants/constants.dart';

class PhoneView extends StatelessWidget {
  const PhoneView({super.key});

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: AppColors.greyBackground,
      child: Center(
        child: Container(
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(
              Radius.circular(AppDimensions.marginXL),
            ),
            border: Border.all(
              width: 15,
              color: AppColors.black,
            ),
          ),
          height: 600,
          width: 300,
        ),
      ),
    );
  }
}
