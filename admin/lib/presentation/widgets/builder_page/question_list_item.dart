import 'package:flutter/material.dart';
import 'package:survey_admin/presentation/utils/utils.dart';

import 'package:survey_admin/presentation/widgets/vector_image.dart';
import 'package:survey_core/survey_core.dart';

class QuestionListItem extends StatelessWidget {
  final QuestionData questionData;
  final void Function(QuestionData data) onTap;
  final bool isSelected;

  const QuestionListItem({
    required this.questionData,
    required this.onTap,
    this.isSelected = false,
    super.key,
  });

  Widget _questionImage(QuestionData questionData) {
    switch (questionData.type) {
      case QuestionTypes.intro:
        return const VectorImage(assetName: AppAssets.introIcon);
      case QuestionTypes.input:
        return const VectorImage(assetName: AppAssets.inputIcon);
      case QuestionTypes.slider:
        return const VectorImage(assetName: AppAssets.sliderIcon);
      case QuestionTypes.choice:
        return (questionData as ChoiceQuestionData).isMultipleChoice
            ? const VectorImage(assetName: AppAssets.multipleChoiceIcon)
            : const VectorImage(assetName: AppAssets.singleChoiceIcon);
      default:
        throw Exception('Unimplemented error');
    }
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = context.theme.textTheme;
    const maxLines = 2;
    return Material(
      child: ListTile(
        onTap: () => onTap(questionData),
        selected: isSelected,
        tileColor: isSelected ? AppColors.greyBackground : AppColors.white,
        title: Padding(
          padding: const EdgeInsets.all(AppDimensions.margin2XS),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: AppDimensions.marginXS),
                child: SizedBox(
                  width: AppDimensions.marginXS + AppDimensions.margin3XS,
                  child: Text(
                    questionData.index.toString(),
                    style: textTheme.bodySmall?.copyWith(
                      color: AppColors.textGrey,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: AppDimensions.marginXS),
              Container(
                decoration: const BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(AppDimensions.circularRadiusS),
                  ),
                  border: Border.fromBorderSide(
                    BorderSide(
                      width: AppDimensions.thinBorderWidth,
                    ),
                  ),
                ),
                height: AppDimensions.imageSizeS,
                width: AppDimensions.imageSizeS,
                child: Center(
                  //ignore: avoid-returning-widgets
                  child: _questionImage(questionData),
                ),
              ),
              const SizedBox(width: AppDimensions.marginXS),
              Expanded(
                child: Text(
                  questionData.title,
                  maxLines: maxLines,
                  overflow: TextOverflow.ellipsis,
                  softWrap: false,
                  style: textTheme.bodyMedium,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
