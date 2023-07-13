import 'package:flutter/material.dart';
import 'package:survey_admin/presentation/app/localization/app_localizations_ext.dart';
import 'package:survey_admin/presentation/entities/survey_action_item.dart';
import 'package:survey_admin/presentation/utils/max_value_formatter.dart';
import 'package:survey_admin/presentation/utils/utils.dart';
import 'package:survey_admin/presentation/widgets/customization_items/customization_widgets/customization_text_field.dart';
import 'package:survey_admin/presentation/widgets/customization_items/dropdown_customization_button.dart';
import 'package:survey_admin/presentation/widgets/vector_image.dart';
import 'package:survey_sdk/survey_sdk.dart';

class ActionsCustomizationItem extends StatefulWidget {
  final ValueChanged<SurveyAction?> onChanged;
  final SurveyAction? surveyAction;
  final CallbackType callbackType;
  final int questionsLength;

  const ActionsCustomizationItem({
    required this.onChanged,
    required this.surveyAction,
    required this.callbackType,
    required this.questionsLength,
    super.key,
  });

  @override
  State<ActionsCustomizationItem> createState() =>
      _ActionsCustomizationItemState();
}

class _ActionsCustomizationItemState extends State<ActionsCustomizationItem> {
  late int _goToQuestionIndex;

  late final List<SurveyActionItem> _actionItems;

  void _initActionsList(BuildContext context) {
    _goToQuestionIndex = widget.surveyAction is GoToAction
        ? (widget.surveyAction! as GoToAction).questionIndex
        : 0;

    _actionItems = [
      SurveyActionItem(
        actionLabel: context.localization.goNextQuestion,
        action: const GoNextAction(),
      ),
      SurveyActionItem(
        actionLabel: context.localization.goPreviousQuestion,
        action: const GoBackAction(),
      ),
      SurveyActionItem(
        actionLabel: context.localization.goToQuestion,
        action: GoToAction(questionIndex: _goToQuestionIndex),
      ),
      SurveyActionItem(
        actionLabel: context.localization.skipQuestion,
        action: const SkipQuestionAction(),
      ),
      SurveyActionItem(
        actionLabel: context.localization.finishSurvey,
        action: const FinishSurveyAction(),
      ),
    ];
  }

  SurveyAction _defaultCallbackByType() => switch (widget.callbackType) {
        CallbackType.primaryCallback => const GoNextAction(),
        CallbackType.secondaryCallback => const SkipQuestionAction(),
      };

  @override
  Widget build(BuildContext context) {
    _initActionsList(context);

    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: DropdownCustomizationButton<SurveyAction?>(
                value: widget.surveyAction,
                items: [
                  for (final actionItem in _actionItems)
                    DropdownCustomizationItem(
                      value: actionItem.action,
                      onChange: widget.onChanged,
                      child: Text(actionItem.actionLabel),
                    ),
                ],
                withColor: true,
              ),
            ),
            if (widget.surveyAction.runtimeType !=
                _defaultCallbackByType().runtimeType)
              GestureDetector(
                onTap: () => widget.onChanged(
                  _defaultCallbackByType(),
                ),
                child: const Padding(
                  padding: EdgeInsets.all(SurveyDimensions.marginS),
                  child: VectorImage(assetName: AppAssets.closeIcon),
                ),
              ),
          ],
        ),
        if (widget.surveyAction is GoToAction)
          _IndexSelector(
            indexValue: (widget.surveyAction! as GoToAction).questionIndex,
            onIndexChanged: (value) => widget.onChanged(
              GoToAction(questionIndex: value),
            ),
            questionsLength: widget.questionsLength,
          ),
      ],
    );
  }
}

class _IndexSelector extends StatelessWidget {
  final int indexValue;
  final ValueChanged<int> onIndexChanged;
  final int questionsLength;

  const _IndexSelector({
    required this.onIndexChanged,
    required this.indexValue,
    required this.questionsLength,
  });

  @override
  Widget build(BuildContext context) {
    const textFieldEmptyValue = '1';

    return Padding(
      padding: const EdgeInsets.all(
        SurveyDimensions.marginM,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            context.localization.questionIndex,
            style: context.theme.textTheme.titleSmall,
          ),
          const SizedBox(height: SurveyDimensions.marginS),
          CustomizationTextField.int(
            style: context.theme.textTheme.bodyMedium,
            initialValue: indexValue.toString(),
            inputFormatters: [
              // Indexing starts from 1 so max index for GoTo is
              // questionsLength + 1 for an EndPage.
              MaxValueFormatter(questionsLength + 1),
            ],
            hintText: context.localization.questionIndex,
            emptyValue: textFieldEmptyValue,
            onChanged: (value) {
              onIndexChanged(
                int.parse(value!),
              );
            },
          ),
        ],
      ),
    );
  }
}
