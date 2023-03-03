import 'package:flutter/material.dart';
import 'package:survey_admin/presentation/app/localization/localizations.dart';
import 'package:survey_admin/presentation/utils/app_fonts.dart';
import 'package:survey_admin/presentation/utils/asset_strings.dart';
import 'package:survey_admin/presentation/utils/colors.dart';
import 'package:survey_admin/presentation/utils/constants/constants.dart';
import 'package:survey_admin/presentation/widgets/vector_image.dart';
import 'package:survey_core/survey_core.dart';

class QuestionListItem extends StatelessWidget {
  final QuestionData questionData;

  const QuestionListItem({
    required this.questionData,
    super.key,
  });

  Widget _questionImage(QuestionData questionData) {
    switch (questionData.type) {
      case 'Intro':
        return const VectorImage(assetName: AssetStrings.intro);
      case 'Input':
        return const VectorImage(assetName: AssetStrings.input);
      case 'Slider':
        return const VectorImage(assetName: AssetStrings.slider);
      case 'Choice':
        return (questionData as ChoiceQuestionData).isMultipleChoice
            ? const VectorImage(assetName: AssetStrings.multipleChoice)
            : const VectorImage(assetName: AssetStrings.singleChoice);
      default:
        throw Exception('Unimplemented error');
    }
  }

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
              //TODO: to const maybe???
              height: 40,
              width: 40,
              child: _questionImage(questionData),
            ),
            const SizedBox(width: AppDimensions.marginXS),
            Text(questionData.type),
          ],
        ),
      ),
    );
  }
}
