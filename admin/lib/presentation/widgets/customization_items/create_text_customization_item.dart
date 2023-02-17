import 'package:flutter/material.dart';
import 'package:survey_admin/presentation/utils/app_fonts.dart';
import 'package:survey_admin/presentation/utils/colors.dart';
import 'package:survey_admin/presentation/utils/constants/constants.dart';
import 'package:survey_admin/presentation/widgets/customization_items/customization_widgets/customization_text.dart';

class CreateTextCustomizationItem extends StatelessWidget {
  final String title;
  final void Function(String text) onChanged;

  const CreateTextCustomizationItem({
    Key? key,
    required this.title,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppDimensions.marginM),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomizationText(title),
          const SizedBox(height: AppDimensions.margin2XS),
          Expanded(
            child: TextField(
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: 'Enter text',
              ),
              maxLines: 10,
              style: const TextStyle(
                fontSize: AppFonts.sizeL,
                fontWeight: AppFonts.weightRegular,
                color: AppColors.black,
              ),
              onChanged: onChanged,
            ),
          ),
        ],
      ),
    );
  }
}
