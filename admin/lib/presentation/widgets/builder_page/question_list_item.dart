import 'package:flutter/material.dart';
import 'package:survey_admin/presentation/utils/app_fonts.dart';
import 'package:survey_admin/presentation/utils/colors.dart';
import 'package:survey_admin/presentation/utils/constants/constants.dart';
import 'package:survey_core/survey_core.dart';

class QuestionListItem extends StatelessWidget {
  final QuestionData questionData;
  final void Function(QuestionData data) onTap;
  final bool isSelected;

  const QuestionListItem({
    super.key,
    required this.questionData,
    required this.onTap,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () => onTap(questionData),
      selected: isSelected,
      title: Padding(
        padding: const EdgeInsets.all(AppDimensions.margin2XS),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: AppDimensions.marginXS),
              child: Text(
                questionData.index.toString(),
                style: const TextStyle(
                  color: AppColors.textGrey,
                  fontSize: AppFonts.sizeS,
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
            Text(questionData.type),
          ],
        ),
      ),
    );
  }
}
