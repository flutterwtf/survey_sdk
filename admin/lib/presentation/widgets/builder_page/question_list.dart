import 'package:context_menus/context_menus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:survey_admin/presentation/app/localization/localizations.dart';
import 'package:survey_admin/presentation/pages/new_question_page/new_question_page.dart';
import 'package:survey_admin/presentation/utils/app_fonts.dart';
import 'package:survey_admin/presentation/utils/colors.dart';
import 'package:survey_admin/presentation/utils/constants/app_assets.dart';
import 'package:survey_admin/presentation/utils/constants/app_dimensions.dart';
import 'package:survey_admin/presentation/utils/theme_extension.dart';
import 'package:survey_admin/presentation/widgets/builder_page/question_list_item.dart';
import 'package:survey_admin/presentation/widgets/customization_items/item_divider.dart';
import 'package:survey_core/survey_core.dart';

class QuestionList extends StatefulWidget {
  final ValueChanged<QuestionData> onSelect;
  final ValueChanged<QuestionData> onAdd;
  final List<QuestionData> questionList;

  const QuestionList({
    required this.onSelect,
    required this.onAdd,
    required this.questionList,
    super.key,
  });

  @override
  State<QuestionList> createState() => _QuestionListState();
}

class _QuestionListState extends State<QuestionList> {
  late List<QuestionData> _questionList;
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _questionList = widget.questionList;
    widget.onSelect(_questionList.first);
    RawKeyboard.instance.addListener(_handleKeyDown);
  }

  void _handleKeyDown(RawKeyEvent value) {
    if (value is RawKeyDownEvent) {
      final key = value.logicalKey;
      if (key == LogicalKeyboardKey.delete) {
        setState(() => _questionList.removeAt(_selectedIndex));
      }
    }
  }

  @override
  void dispose() {
    RawKeyboard.instance.removeListener(_handleKeyDown);
    super.dispose();
  }

  void _addQuestion(QuestionData data) {
    final index = _questionList.length + 1;
    setState(() {
      _questionList.add(
        data.copyWith(index: index),
      );
    });
    widget.onAdd(data.copyWith(index: index));
  }

  void _updateQuestion(int oldIndex, int newIndex) {
    final itemOld = _questionList.removeAt(oldIndex);
    _questionList.insert(
      newIndex,
      itemOld,
    );
    for (var i = 0; i < _questionList.length; i++) {
      _questionList[i] = _questionList[i].copyWith(index: i + 1);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppDimensions.surveyContentBarWidth,
      color: AppColors.white,
      child: Column(
        children: [
          const ItemDivider(),
          _ListHeader(
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
            questionList: _questionList,
          ),
          Expanded(
            child: ContextMenuOverlay(
              cardBuilder: (_, children) {
                return DecoratedBox(
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(
                      AppDimensions.circularRadiusXS,
                    ),
                    border: Border.all(
                      width: 0.5,
                    ),
                  ),
                  child: Column(children: children),
                );
              },
              child: ReorderableListView(
                buildDefaultDragHandles: false,
                children: [
                  for (int index = 0; index < _questionList.length; index++)
                    _Question(
                      key: ValueKey(index),
                      index: index,
                      isSelected: index == _selectedIndex,
                      onDeleteButtonPressed: () =>
                          setState(() => _questionList.removeAt(index)),
                      question: _questionList[index],
                      onQuestionTap: (data) {
                        widget.onSelect(data);
                        setState(() {
                          _selectedIndex = index;
                        });
                      },
                    ),
                ],
                onReorder: (oldIndex, newIndex) {
                  if (newIndex > oldIndex) newIndex--;
                  setState(
                    () {
                      _updateQuestion(oldIndex, newIndex);
                    },
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ListHeader extends StatelessWidget {
  final VoidCallback onAddButtonTap;
  final List<QuestionData> questionList;

  const _ListHeader({
    required this.onAddButtonTap,
    required this.questionList,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
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
            onTap: onAddButtonTap,
            child: SizedBox(
              height: AppDimensions.sizeL,
              width: AppDimensions.sizeL,
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
  final VoidCallback onDeleteButtonPressed;
  final ValueChanged<QuestionData> onQuestionTap;
  final QuestionData question;

  const _Question({
    required this.index,
    required this.isSelected,
    required this.onDeleteButtonPressed,
    required this.question,
    required this.onQuestionTap,
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
              context.localization.delete_question,
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
