import 'package:flutter/material.dart';
import 'package:survey_admin/presentation/app/localization/localizations.dart';
import 'package:survey_admin/presentation/utils/app_fonts.dart';
import 'package:survey_admin/presentation/utils/colors.dart';
import 'package:survey_admin/presentation/utils/constants/constants.dart';
import 'package:survey_admin/presentation/widgets/customization_items/customization_widgets/customization_text_field.dart';

class OptionCustomizationItem extends StatefulWidget {
  final List<String> options;
  final ValueChanged<List<String>> onChanged;

  const OptionCustomizationItem({
    Key? key,
    required this.options,
    required this.onChanged,
  }) : super(key: key);

  @override
  State<OptionCustomizationItem> createState() => _OptionCustomizationItemState();
}

class _OptionCustomizationItemState extends State<OptionCustomizationItem> {
  final TextEditingController _controller = TextEditingController();
  List<String> _options = [];

  @override
  void initState() {
    super.initState();
    _options = widget.options;
  }

  void onEditingComplete() {
    if (_controller.text.isNotEmpty) {
      setState(() {
        _options = [..._options, _controller.text];
      });
    }
    _controller.clear();
    widget.onChanged(_options);
  }

  void delete(int index) {
    setState(() => _options.removeAt(index));
    widget.onChanged(_options);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListView.builder(
          shrinkWrap: true,
          itemCount: _options.length,
          itemBuilder: (context, index) => _Option(
            option: _options[index],
            delete: () => delete(index),
          ),
        ),
        const SizedBox(
          height: AppDimensions.sizeS,
        ),
        Row(
          children: [
            const Icon(
              Icons.fiber_manual_record,
              size: AppDimensions.sizeS,
              color: AppColors.textLightGrey,
            ),
            const SizedBox(
              width: AppDimensions.margin2XS,
            ),
            Expanded(
              child: CustomizationTextField(
                controller: _controller,
                onEditingComplete: onEditingComplete,
                decoration: InputDecoration.collapsed(
                  hintText: context.localization.type_new_option_here,
                  hintStyle: const TextStyle(
                    color: AppColors.textHintGrey,
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _Option extends StatelessWidget {
  final String option;
  final VoidCallback delete;

  const _Option({
    Key? key,
    required this.option,
    required this.delete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(
          Icons.fiber_manual_record,
          size: AppDimensions.sizeS,
        ),
        const SizedBox(
          width: AppDimensions.margin2XS,
        ),
        Expanded(
          child: Text(
            option,
            style: const TextStyle(fontSize: AppFonts.sizeL),
          ),
        ),
        IconButton(
          padding: EdgeInsets.zero,
          icon: const Icon(
            Icons.close,
            size: AppDimensions.sizeM,
          ),
          onPressed: delete,
        ),
      ],
    );
  }
}
