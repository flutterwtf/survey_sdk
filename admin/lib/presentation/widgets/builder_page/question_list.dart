import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:survey_admin/presentation/app/localization/localizations.dart';
import 'package:survey_admin/presentation/pages/new_question_page/new_question_page.dart';
import 'package:survey_admin/presentation/utils/app_fonts.dart';
import 'package:survey_admin/presentation/utils/colors.dart';
import 'package:survey_admin/presentation/utils/constants/app_assets.dart';
import 'package:survey_admin/presentation/utils/constants/constants.dart';
import 'package:survey_admin/presentation/utils/theme_extension.dart';
import 'package:survey_admin/presentation/widgets/builder_page/question_list_item.dart';
import 'package:survey_core/survey_core.dart';

class QuestionList extends StatefulWidget {
  final List<QuestionData> questionsList;
  final void Function(QuestionData) onSelect;

  const QuestionList({
    required this.questionsList,
    required this.onSelect,
    super.key,
  });

  @override
  State<QuestionList> createState() => _QuestionListState();
}

class _QuestionListState extends State<QuestionList> {
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();

    widget.onSelect(widget.questionsList.first);
  }

  void addQuestion(QuestionData data) {
    final index = widget.questionsList.length;
    setState(() {
      widget.questionsList.add(
        data.copyWith(index: index),
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
                  style: context.theme.textTheme.titleMedium?.copyWith(
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
                    child: SvgPicture.asset(AppAssets.addCircleIcon),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReorderableListView(
              buildDefaultDragHandles: false,
              children: [
                for (int index = 0;
                    index < widget.questionsList.length;
                    index++)
                  ReorderableDragStartListener(
                    index: index,
                    key: ValueKey(index),
                    child: QuestionListItem(
                      isSelected: index == _selectedIndex,
                      questionData: widget.questionsList[index],
                      onTap: (data) {
                        widget.onSelect(data);
                        setState(() {
                          _selectedIndex = index;
                        });
                      },
                    ),
                  )
              ],
              onReorder: (oldIndex, newIndex) {
                if (newIndex > oldIndex) newIndex--;
                setState(
                  () {
                    if (_selectedIndex == oldIndex) {
                      _selectedIndex = newIndex;
                    } else if (_selectedIndex == newIndex) {
                      _selectedIndex = oldIndex;
                    }
                    final oldItem = widget.questionsList[oldIndex];
                    final newItem = widget.questionsList[newIndex];
                    widget.questionsList[newIndex] = oldItem.copyWith(
                      index: newIndex,
                    );
                    widget.questionsList[oldIndex] = newItem.copyWith(
                      index: oldIndex,
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
