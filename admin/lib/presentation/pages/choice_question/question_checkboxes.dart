part of 'choice_question_page.dart';

class _QuestionCheckboxes extends StatelessWidget {
  const _QuestionCheckboxes({
    required this.options,
    required this.onChanged,
    required this.activeColor,
    required this.inactiveColor,
  });

  final List<String> options;
  final void Function(List<String>? selectedItems) onChanged;
  final Color activeColor;
  final Color inactiveColor;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        unselectedWidgetColor: inactiveColor,
      ),
      child: FormBuilder(
        child: FormBuilderCheckboxGroup(
          orientation: OptionsOrientation.vertical,
          decoration: const InputDecoration(
            border: InputBorder.none,
          ),
          activeColor: activeColor,
          onChanged: onChanged,
          name: '',
          options: options
              .map(
                (option) => FormBuilderFieldOption(
                  value: option,
                  child: Text(
                    option,
                    style: const TextStyle(
                      fontSize: AppFonts.sizeM,
                    ),
                  ),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
