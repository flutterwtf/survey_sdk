import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:survey_admin/presentation/widgets/customization_items/customization_widgets/customization_text_field.dart';
import 'package:survey_sdk/survey_sdk.dart';

class MainButtonActionItem extends StatefulWidget {
  final ValueChanged<MainButtonAction> onChanged;

  const MainButtonActionItem({
    required this.onChanged,
    super.key,
  });

  @override
  State<MainButtonActionItem> createState() => _MainButtonActionItemState();
}

class _MainButtonActionItemState extends State<MainButtonActionItem> {
  MainButtonAction? _mainButtonAction;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        PopupMenuButton(
          onSelected: (value) {
            setState(() => _mainButtonAction = value);
            widget.onChanged(value);
          },
          itemBuilder: (_) => <PopupMenuEntry<MainButtonAction>>[
            PopupMenuItem(
              value: GoToAction(questionIndex: 0),
              child: const Text('Go to'),
            ),
            PopupMenuItem(
              value: FinishSurveyAction(),
              child: const Text('Finish survey'),
            ),
            PopupMenuItem(
              value: SkipQuestionAction(),
              child: const Text('Skip question'),
            ),
          ],
        ),
        if (_mainButtonAction is GoToAction)
          _GoToIndexSelector(
            onIndexChanged: (value) => widget.onChanged(
              GoToAction(questionIndex: value),
            ),
          ),
      ],
    );
  }
}

class _GoToIndexSelector extends StatelessWidget {
  final ValueChanged<int> onIndexChanged;

  const _GoToIndexSelector({required this.onIndexChanged});

  @override
  Widget build(BuildContext context) {
    return CustomizationTextField.int(
      inputFormatters: [
        LengthLimitingTextInputFormatter(3),
      ],
      hintText: 'question index',
      onChanged: (value) => onIndexChanged(
        int.parse(value!),
      ),
    );
  }
}
