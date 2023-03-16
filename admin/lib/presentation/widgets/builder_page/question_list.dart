import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:survey_admin/presentation/app/localization/localizations.dart';
import 'package:survey_admin/presentation/pages/builder/builder_cubit.dart';
import 'package:survey_admin/presentation/pages/builder/builder_state.dart';
import 'package:survey_admin/presentation/pages/new_question_page/new_question_page.dart';
import 'package:survey_admin/presentation/utils/app_fonts.dart';
import 'package:survey_admin/presentation/utils/colors.dart';
import 'package:survey_admin/presentation/utils/constants/app_assets.dart';
import 'package:survey_admin/presentation/utils/constants/app_dimensions.dart';
import 'package:survey_admin/presentation/utils/theme_extension.dart';
import 'package:survey_admin/presentation/widgets/builder_page/question_list_item.dart';
import 'package:survey_admin/presentation/widgets/customization_items/item_divider.dart';

class QuestionList extends StatefulWidget {
  final BuilderCubit cubit;

  const QuestionList({
    required this.cubit,
    super.key,
  });

  @override
  State<QuestionList> createState() => _QuestionListState();
}

class _QuestionListState extends State<QuestionList> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BuilderCubit, BuilderState>(
      bloc: widget.cubit,
      builder: (context, state) {
        return Container(
          width: AppDimensions.surveyContentBarWidth,
          color: AppColors.white,
          child: Column(
            children: [const ItemDivider(),
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
                          widget.cubit.add(questionData);
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
                  onReorder: widget.cubit.swapQuestions,
                  children: [
                    for (final question in state.questions)
                      ReorderableDragStartListener(
                        index: question.index,
                        key: ValueKey(question.index),
                        child: QuestionListItem(
                          isSelected: state.selectedQuestion == question,
                          questionData: question,
                          onTap: widget.cubit.select,
                        ),
                      )
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
