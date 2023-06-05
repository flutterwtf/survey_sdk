import 'package:flutter/material.dart';
import 'package:survey_admin/presentation/utils/constants/app_dimensions.dart';
import 'package:survey_admin/presentation/utils/theme_extension.dart';

class Option extends StatelessWidget {
  final String option;
  final VoidCallback onDelete;

  const Option({
    required this.option,
    required this.onDelete,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(
          Icons.fiber_manual_record,
          size: AppDimensions.sizeS,
        ),
        const SizedBox(width: AppDimensions.margin2XS),
        Expanded(
          child: Text(
            option,
            style: context.theme.textTheme.bodyLarge,
          ),
        ),
        IconButton(
          padding: EdgeInsets.zero,
          icon: const Icon(
            Icons.close,
            size: AppDimensions.sizeM,
          ),
          onPressed: onDelete,
        ),
      ],
    );
  }
}
