part of 'choice_question_page.dart';

class _QuestionRadioButtons extends StatelessWidget {
  const _QuestionRadioButtons({
    required this.options,
    required this.onChanged,
    required this.activeColor,
    required this.inactiveColor,
  });

  final List<String> options;
  final void Function(String? selectedItem) onChanged;
  final Color activeColor;
  final Color inactiveColor;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        unselectedWidgetColor: inactiveColor,
      ),
      child: FormBuilder(
        child: FormBuilderRadioGroup(
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
