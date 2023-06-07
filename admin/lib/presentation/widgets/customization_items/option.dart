import 'package:flutter/material.dart';
import 'package:survey_sdk/survey_sdk.dart';

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
          size: SurveyDimensions.sizeS,
        ),
        const SizedBox(width: SurveyDimensions.margin2XS),
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
            size: SurveyDimensions.sizeM,
          ),
          onPressed: onDelete,
        ),
      ],
    );
  }
}
