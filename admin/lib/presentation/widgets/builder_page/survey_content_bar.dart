import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:survey_admin/presentation/app/localization/localizations.dart';
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
  final _quiestionsList = [
    const SurveyQuestionListItem(index: 1, title: 'Intro'),
    const SurveyQuestionListItem(index: 2, title: 'Title'),
  ];

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
              horizontal: AppDimensions.marginLargeM,
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
                  width: AppDimensions.margin3XL + AppDimensions.margin2XL,
                ),
                SizedBox(
                  height: AppDimensions.size3M,
                  width: AppDimensions.size3M,
                  child: SvgPicture.asset(AssetStrings.addCircle),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReorderableListView(
              buildDefaultDragHandles: false,
              children: [
                for (int index = 0; index < _quiestionsList.length; index++)
                  ReorderableDragStartListener(
                    index: index,
                    key: ValueKey(_quiestionsList[index].title),
                    child: SurveyQuestionListItem(
                      index: index + 1,
                      title: _quiestionsList[index].title,
                    ),
                  )
              ],
              onReorder: (oldIndex, newIndex) {
                setState(() {
                  if (newIndex > oldIndex) newIndex--;

                  final item = _quiestionsList.removeAt(oldIndex);
                  _quiestionsList.insert(newIndex, item);
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
