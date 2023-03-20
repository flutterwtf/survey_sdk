import 'package:flutter/material.dart';
import 'package:survey_admin/presentation/utils/colors.dart';
import 'package:survey_admin/presentation/utils/constants/app_dimensions.dart';

class ItemDivider extends StatelessWidget {
  const ItemDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return const Divider(
      color: AppColors.greyBackground,
      thickness: AppDimensions.thinBorderWidth,
    );
  }
}
