import 'package:context_menus/context_menus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:survey_admin/presentation/app/localization/app_localizations_ext.dart';
import 'package:survey_admin/presentation/pages/new_question_page/new_question_page.dart';
import 'package:survey_admin/presentation/utils/utils.dart';
import 'package:survey_admin/presentation/widgets/builder_page/question_list_item.dart';
import 'package:survey_sdk/survey_sdk.dart';

class QuestionList extends StatefulWidget {
  final ValueChanged<QuestionData> onSelect;
  final ValueChanged<QuestionData> onAdd;
  final ValueChanged<QuestionData> onDelete;
  final ValueChanged<List<QuestionData>> onUpdate;
  final ValueChanged<EndQuestionData> onUpdateEndQuestion;
  final int? selectedIndex;
  final List<QuestionData> questions;
  final EndQuestionData endPage;
  final bool isEditMode;

  const QuestionList({
    required this.onSelect,
    required this.onAdd,
    required this.questions,
    required this.endPage,
    required this.onUpdate,
    required this.onUpdateEndQuestion,
    required this.onDelete,
    required this.selectedIndex,
    this.isEditMode = true,
    super.key,
  });

  @override
  State<QuestionList> createState() => _QuestionListState();
}

class _QuestionListState extends State<QuestionList> {
  void _addQuestion(QuestionData data) {
    final index = widget.questions.length + 1;
    widget.onAdd(data.copyWith(index: index));
  }

  void _updateQuestion(int oldIndex, int newIndex) {
    final updatedIndex = newIndex >= widget.questions.length
        ? widget.questions.length - 1
        : newIndex;

    final itemOld = widget.questions.removeAt(oldIndex);
    widget.questions.insert(updatedIndex, itemOld);

    for (var i = 0; i < widget.questions.length; i++) {
      widget.questions[i] = widget.questions[i].copyWith(index: i + 1);
    }

    widget.onUpdate(widget.questions);
  }

  @override
  Widget build(BuildContext context) {
    final length = widget.questions.length;

    return AnimatedContainer(
      duration: SurveyDurations.panelSwitchingDuration,
      color: SurveyColors.white,
      width: widget.isEditMode ? SurveyDimensions.surveyContentBarWidth : 0,
      child: OverflowBox(
        maxWidth: SurveyDimensions.surveyContentBarWidth,
        child: Column(
          children: [
            const Divider(),
            _ListHeader(
              //ignore: avoid-passing-async-when-sync-expected
              onAddButtonTap: () async {
                final questionData = await Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const NewQuestionPage(),
                  ),
                );
                if (questionData != null) {
                  _addQuestion(questionData);
                }
              },
              isEditingCommonTheme: widget.selectedIndex == -1,
              questionList: widget.questions,
            ),
            Expanded(
              child: ContextMenuOverlay(
                child: ReorderableListView(
                  proxyDecorator: (widget, _, __) => widget,
                  onReorder: (oldIndex, newIndex) {
                    setState(() {
                      if (newIndex > oldIndex) newIndex--;
                      _updateQuestion(oldIndex, newIndex);
                    });
                  },
                  buildDefaultDragHandles: false,
                  children: [
                    for (int index = 0; index < length; index++)
                      _Question(
                        key: ValueKey(index),
                        index: index,
                        isSelected: index == widget.selectedIndex,
                        onDeleteButtonPressed: () => widget.onDelete(
                          widget.questions[index],
                        ),
                        question: widget.questions[index],
                        onQuestionTap: widget.onSelect,
                      ),
                    _Question(
                      key: ValueKey(length),
                      index: length,
                      isSelected: length == widget.selectedIndex,
                      question: widget.endPage,
                      onQuestionTap: widget.onSelect,
                    ),
                  ],
                ),
                cardBuilder: (_, children) {
                  return DecoratedBox(
                    decoration: const BoxDecoration(
                      color: SurveyColors.white,
                      border: Border.fromBorderSide(BorderSide(width: 0.5)),
                      borderRadius: BorderRadius.all(
                        Radius.circular(SurveyDimensions.circularRadiusXS),
                      ),
                    ),
                    child: Column(children: children),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ListHeader extends StatelessWidget {
  final VoidCallback onAddButtonTap;
  final List<QuestionData> questionList;
  final bool isEditingCommonTheme;

  const _ListHeader({
    required this.onAddButtonTap,
    required this.questionList,
    required this.isEditingCommonTheme,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: SurveyDimensions.margin2XS,
        horizontal: SurveyDimensions.marginXL,
      ),
      child: Row(
        children: [
          Text(
            context.localization.survey,
            style: context.theme.textTheme.titleMedium?.copyWith(
              fontWeight: SurveyFonts.weightBold,
            ),
          ),
          const SizedBox(
            width: SurveyDimensions.margin4XL,
          ),
          GestureDetector(
            onTap: onAddButtonTap,
            child: SizedBox(
              height: SurveyDimensions.sizeL,
              width: SurveyDimensions.sizeL,
              child: SvgPicture.asset(AppAssets.addCircleIcon),
            ),
          ),
        ],
      ),
    );
  }
}

class _Question extends StatelessWidget {
  final int index;
  final bool isSelected;
  final VoidCallback? onDeleteButtonPressed;
  final ValueChanged<QuestionData> onQuestionTap;
  final QuestionData question;

  const _Question({
    required this.index,
    required this.isSelected,
    required this.question,
    required this.onQuestionTap,
    this.onDeleteButtonPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ReorderableDragStartListener(
      index: index,
      child: ContextMenuRegion(
        contextMenu: GenericContextMenu(
          buttonConfigs: [
            ContextMenuButtonConfig(
              context.localization.deleteQuestion,
              onPressed: onDeleteButtonPressed,
            ),
          ],
        ),
        child: QuestionListItem(
          isSelected: isSelected,
          questionData: question,
          onTap: onQuestionTap,
        ),
      ),
    );
  }
}
