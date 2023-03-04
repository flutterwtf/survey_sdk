import 'package:flutter/material.dart';
import 'package:survey_admin/presentation/utils/colors.dart';
import 'package:survey_admin/presentation/utils/constants/constants.dart';
import 'package:survey_admin/presentation/utils/theme_extension.dart';
import 'package:survey_core/survey_core.dart';

class QuestionListItem extends StatelessWidget {
  final QuestionData questionData;

  const QuestionListItem({
    required this.questionData,
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
              padding: const EdgeInsets.only(top: AppDimensions.marginXS),
              child: Text(
                questionData.index.toString(),
                style: context.theme.textTheme.bodySmall?.copyWith(
                  color: AppColors.textGrey,
                ),
              ),
            ),
            const SizedBox(width: AppDimensions.marginXS),
            Container(
              decoration: const BoxDecoration(
                color: AppColors.switchBackgroundActive,
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              // TODO(dev): to const maybe???
              height: 40,
              width: 40,
            ),
            const SizedBox(width: AppDimensions.marginXS),
            Text(
              questionData.type,
              style: context.theme.textTheme.bodyMedium,
            ),
          ],
        ),
      ),
    );
  }
}
