import 'package:flutter/material.dart';
import 'package:survey_admin/presentation/utils/colors.dart';

class ItemDivider extends StatelessWidget {
  const ItemDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return const Divider(
      color: AppColors.greyBackground,
      thickness: 0.6,
      height: 1,
    );
  }
}
