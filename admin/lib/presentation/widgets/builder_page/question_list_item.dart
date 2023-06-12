import 'package:flutter/material.dart';
import 'package:survey_admin/presentation/utils/utils.dart';
import 'package:survey_admin/presentation/widgets/vector_image.dart';
import 'package:survey_sdk/survey_sdk.dart';

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
      case QuestionTypes.info:
        return const VectorImage(assetName: AppAssets.infoIcon);
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
        tileColor:
            isSelected ? SurveyColors.greyBackground : SurveyColors.white,
        title: Padding(
          padding: const EdgeInsets.all(SurveyDimensions.margin2XS),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: SurveyDimensions.marginXS),
                child: SizedBox(
                  width: SurveyDimensions.marginXS + SurveyDimensions.margin3XS,
                  child: Text(
                    questionData.index.toString(),
                    style: textTheme.bodySmall?.copyWith(
                      color: SurveyColors.textGrey,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: SurveyDimensions.marginXS),
              Container(
                decoration: const BoxDecoration(
                  color: SurveyColors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(SurveyDimensions.circularRadiusS),
                  ),
                  border: Border.fromBorderSide(
                    BorderSide(
                      width: SurveyDimensions.thinBorderWidth,
                    ),
                  ),
                ),
                height: SurveyDimensions.imageSizeS,
                width: SurveyDimensions.imageSizeS,
                child: Center(
                  //ignore: avoid-returning-widgets
                  child: _questionImage(questionData),
                ),
              ),
              const SizedBox(width: SurveyDimensions.marginXS),
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
