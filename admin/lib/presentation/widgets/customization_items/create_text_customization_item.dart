import 'package:flutter/material.dart';
import 'package:survey_admin/presentation/app/localization/localizations.dart';
import 'package:survey_admin/presentation/utils/app_fonts.dart';
import 'package:survey_admin/presentation/utils/colors.dart';

class CreateTextCustomizationItem extends StatelessWidget {
  final double maxHeight;
  final void Function(String text) onChanged;

  const CreateTextCustomizationItem({
    required this.maxHeight,
    required this.onChanged,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // LimitedBox, isCollapsed: true, maxLines: null - used to make
    // this TextField expandable
    return LimitedBox(
      maxHeight: maxHeight,
      child: TextField(
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: context.localization.enter_text,
          isCollapsed: true,
        ),
        maxLines: null,
        style: const TextStyle(
          fontSize: AppFonts.sizeL,
          fontWeight: AppFonts.weightRegular,
          color: AppColors.black,
        ),
        onChanged: onChanged,
      ),
    );
  }
}
