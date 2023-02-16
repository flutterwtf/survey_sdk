import 'package:flutter/material.dart';
import 'package:survey_sdk/presentation/utils/colors.dart';

class PhoneRedactor extends StatelessWidget {
  const PhoneRedactor({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.whitePrimaryBackground,
      width: 300,
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
