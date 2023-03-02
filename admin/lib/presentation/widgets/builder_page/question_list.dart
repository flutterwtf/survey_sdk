import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:survey_admin/presentation/app/localization/localizations.dart';
import 'package:survey_admin/presentation/pages/new_question_page/new_question_page.dart';
import 'package:survey_admin/presentation/utils/app_fonts.dart';
import 'package:survey_admin/presentation/utils/asset_strings.dart';
import 'package:survey_admin/presentation/utils/colors.dart';
import 'package:survey_admin/presentation/utils/constants/constants.dart';
import 'package:survey_admin/presentation/widgets/builder_page/question_list_item.dart';
import 'package:survey_core/survey_core.dart';

// ignore: lines_longer_than_80_chars
// TODO(dev): do we really need "Survey" prefix? If so, why do we have it only in several classes
class QuestionList extends StatefulWidget {
  final void Function(QuestionData) onSelect;

  const QuestionList({
    required this.onSelect,
    super.key,
  });

  @override
  State<QuestionList> createState() => _QuestionListState();
}

class _QuestionListState extends State<QuestionList> {
  final _questionList = [
    const QuestionListItem(
      questionData: IntroQuestionData.common(),
    ),
    QuestionListItem(
      questionData: InputQuestionData.common(index: 1),
    ),
  ];

  void addQuestion(QuestionData data) {
    // TODO(dev): use data.copyWith instead of this
    //final index = _questionList.length;
    //data.index = index;
    setState(() {
      _questionList.add(
        QuestionListItem(
          questionData: data,
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppDimensions.surveyContentBarWidth,
      color: AppColors.white,
      child: Column(
        children: [
          const Divider(
            color: AppColors.greyBackground,
            thickness: 0.6,
            height: 1,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: AppDimensions.margin2XS,
              horizontal: AppDimensions.marginXL,
            ),
            child: Row(
              children: [
                Text(
                  context.localization.survey,
                  style: const TextStyle(
                    color: AppColors.text,
                    fontWeight: AppFonts.weightBold,
                  ),
                ),
                const SizedBox(
                  width: AppDimensions.margin4XL + AppDimensions.margin3XL,
                ),
                GestureDetector(
                  onTap: () => Navigator.of(context).push(
                    // ignore: inference_failure_on_instance_creation
                    MaterialPageRoute(
                      builder: (context) => NewQuestionPage(
                        onSubmit: addQuestion,
                      ),
                    ),
                  ),
                  child: SizedBox(
                    height: AppDimensions.sizeL,
                    width: AppDimensions.sizeL,
                    child: SvgPicture.asset(AssetStrings.addCircle),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReorderableListView(
              buildDefaultDragHandles: false,
              children: [
                for (int index = 0; index < _questionList.length; index++)
                  ReorderableDragStartListener(
                    index: index,
                    key: ValueKey(index),
                    child: _questionList
                        .where((item) => item.questionData.index == index)
                        .first,
                  )
              ],
              onReorder: (oldIndex, newIndex) {
                setState(() {
                  // TODO(dev): use data.copyWith instead of this
                  /*
                  final itemFirst = _questionList
                      .where((item) => item.questionData.index == oldIndex)
                      .first;
                  final itemSecond = _questionList
                      .where((item) => item.questionData.index == newIndex)
                      .first;

                  itemFirst.questionData.index = newIndex;
                  itemSecond.questionData.index = oldIndex;
                   */
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
