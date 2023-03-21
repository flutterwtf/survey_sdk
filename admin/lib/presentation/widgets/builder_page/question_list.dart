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
import 'package:survey_core/survey_core.dart';

class QuestionList extends StatefulWidget {
  final ValueChanged<QuestionData> onSelect;
  final VoidCallback onEditCommonTheme;
  final ValueChanged<QuestionData> onAdd;
  final List<QuestionData> questions;

  const QuestionList({
    required this.onSelect,
    required this.onEditCommonTheme,
    required this.onAdd,
    required this.questions,
    super.key,
  });

  @override
  State<QuestionList> createState() => _QuestionListState();
}

class _QuestionListState extends State<QuestionList> {
  late List<QuestionData> _questionList;
  int _selectedIndex = 0;
  final _commonThemeIndex = -1;

  @override
  void initState() {
    super.initState();
    if (widget.questions.isNotEmpty) {
      widget.onSelect(widget.questions.first);
    }
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
  void didChangeDependencies() {
    super.didChangeDependencies();
    _questionList = widget.questions;
  }

  @override
  void dispose() {
    RawKeyboard.instance.removeListener(_handleKeyDown);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.white,
      width: AppDimensions.surveyContentBarWidth,
      child: Column(
        children: [
          const Divider(),
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
            onEditCommonTheme: () {
              setState(() => _selectedIndex = _commonThemeIndex);
              widget.onEditCommonTheme();
            },
            isEditingCommonTheme: _selectedIndex == _commonThemeIndex,
            questionList: _questionList,
          ),
          Expanded(
            child: ContextMenuOverlay(
              child: ReorderableListView(
                onReorder: (oldIndex, newIndex) {
                  if (newIndex > oldIndex) newIndex--;
                  setState(() {
                    _updateQuestion(oldIndex, newIndex);
                  });
                },
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
                        setState(
                          () {
                            _selectedIndex = index;
                          },
                        );
                      },
                    ),
                ],
              ),
              cardBuilder: (_, children) {
                return DecoratedBox(
                  decoration: const BoxDecoration(
                    color: AppColors.white,
                    border: Border.fromBorderSide(BorderSide(width: 0.5)),
                    borderRadius: BorderRadius.all(
                      Radius.circular(AppDimensions.circularRadiusXS),
                    ),
                  ),
                  child: Column(children: children),
                );
              },
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
  final VoidCallback onEditCommonTheme;
  final bool isEditingCommonTheme;

  const _ListHeader({
    required this.onAddButtonTap,
    required this.questionList,
    required this.onEditCommonTheme,
    required this.isEditingCommonTheme,
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
            width: AppDimensions.margin4XL,
          ),
          GestureDetector(
            onTap: onEditCommonTheme,
            child: Container(
              alignment: Alignment.center,
              height: AppDimensions.sizeL,
              width: AppDimensions.sizeL,
              color: isEditingCommonTheme
                  ? AppColors.greyBackground
                  : AppColors.white,
              child: const Icon(Icons.invert_colors),
            ),
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
