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
    const QuestionListItem(
      questionData: InputQuestionData.common(index: 1),
    ),
  ];

  void addQuestion(QuestionData data) {
    final index = _questionList.length;
    setState(() {
      _questionList.add(
        QuestionListItem(
          questionData: data.copyWith(index: index),
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
                  onTap: () async {
                    final questionData = await Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const NewQuestionPage(),
                      ),
                    );
                    if (questionData != null) {
                      addQuestion(questionData);
                    }
                  },
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
                if (newIndex > oldIndex) newIndex--;
                setState(
                  () {
                    final itemFirstIndex = _questionList.indexWhere(
                      (item) => item.questionData.index == oldIndex,
                    );
                    final itemSecondIndex = _questionList.indexWhere(
                      (item) => item.questionData.index == newIndex,
                    );
                    _questionList[itemFirstIndex] = QuestionListItem(
                      questionData: _questionList[itemFirstIndex]
                          .questionData
                          .copyWith(index: newIndex),
                    );
                    _questionList[itemSecondIndex] = QuestionListItem(
                      questionData: _questionList[itemSecondIndex]
                          .questionData
                          .copyWith(index: oldIndex),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
