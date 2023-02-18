import 'package:flutter/material.dart';
import 'package:survey_admin/presentation/utils/app_fonts.dart';
import 'package:survey_admin/presentation/utils/colors.dart';

class CreateTextCustomizationItem extends StatelessWidget {
  final double maxHeight;
  final void Function(String text) onChanged;

  const CreateTextCustomizationItem({
    Key? key,
    required this.maxHeight,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LimitedBox(
      maxHeight: maxHeight,
      child: Expanded(
        child: TextField(
          decoration: const InputDecoration(
            isCollapsed: true,
            border: InputBorder.none,
            hintText: 'Enter text',
          ),
          maxLines: null,
          style: const TextStyle(
            fontSize: AppFonts.sizeL,
            fontWeight: AppFonts.weightRegular,
            color: AppColors.black,
          ),
          onChanged: onChanged,
        ),
      ),
    );
  }
}
