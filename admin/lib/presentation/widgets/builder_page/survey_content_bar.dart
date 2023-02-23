import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:survey_admin/presentation/app/localization/localizations.dart';
import 'package:survey_admin/presentation/pages/new_question_page/new_question_page.dart';
import 'package:survey_admin/presentation/utils/app_fonts.dart';
import 'package:survey_admin/presentation/utils/asset_strings.dart';
import 'package:survey_admin/presentation/utils/colors.dart';
import 'package:survey_admin/presentation/utils/constants/constants.dart';
import 'package:survey_admin/presentation/widgets/builder_page/survey_question_list_item.dart';

class SurveyContentBar extends StatefulWidget {
  const SurveyContentBar({super.key});

  @override
  State<SurveyContentBar> createState() => _SurveyContentBarState();
}

class _SurveyContentBarState extends State<SurveyContentBar> {
  final _questionsList = [
    const SurveyQuestionListItem(index: 1, title: 'Intro'),
    const SurveyQuestionListItem(index: 2, title: 'Title'),
  ];

  void addQuestion(String title) {
    final index = _questionsList.length;
    setState(() {
      _questionsList.add(SurveyQuestionListItem(index: index, title: title));
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
                for (int index = 0; index < _questionsList.length; index++)
                  ReorderableDragStartListener(
                    index: index,
                    key: ValueKey(index),
                    child: SurveyQuestionListItem(
                      index: index + 1,
                      title: _questionsList[index].title,
                    ),
                  )
              ],
              onReorder: (oldIndex, newIndex) {
                setState(() {
                  if (newIndex > oldIndex) newIndex--;

                  final item = _questionsList.removeAt(oldIndex);
                  _questionsList.insert(newIndex, item);
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
