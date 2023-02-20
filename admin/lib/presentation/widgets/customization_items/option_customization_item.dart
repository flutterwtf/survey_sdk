import 'package:flutter/material.dart';
import 'package:survey_admin/presentation/utils/app_fonts.dart';
import 'package:survey_admin/presentation/utils/colors.dart';
import 'package:survey_admin/presentation/utils/constants/constants.dart';
import 'package:survey_admin/presentation/widgets/customization_items/customization_text_field.dart';

class OptionCustomizationItem extends StatefulWidget {
  final List<String> options;
  final ValueChanged<List<String>> onChanged;

  const OptionCustomizationItem({
    Key? key,
    required this.options,
    required this.onChanged,
  }) : super(key: key);

  @override
  State<OptionCustomizationItem> createState() =>
      _OptionCustomizationItemState();
}

class _OptionCustomizationItemState extends State<OptionCustomizationItem> {
  TextEditingController controller = TextEditingController();

  void onEditingComplete() {
    if (controller.text.isNotEmpty) {
      setState(() {
        widget.options.add(controller.text);
      });
    }
    controller.clear();
    widget.onChanged(widget.options);
  }

  void delete(int index) {
    setState(() => widget.options.removeAt(index));
    widget.onChanged(widget.options);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListView.builder(
          shrinkWrap: true,
          itemCount: widget.options.length,
          itemBuilder: (context, index) => _Option(
            option: widget.options[index],
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
              color: AppColors.textGrey,
            ),
            const SizedBox(
              width: AppDimensions.margin2XS,
            ),
            Expanded(
              child: CustomizationTextField(
                controller: controller,
                onEditingComplete: onEditingComplete,
                decoration: const InputDecoration.collapsed(
                  hintText: 'Type new option here',
                  hintStyle: TextStyle(
                    color: AppColors.textLightGrey,
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
