import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:survey_admin/presentation/utils/app_fonts.dart';
import 'package:survey_admin/presentation/utils/colors.dart';
import 'package:survey_admin/presentation/utils/theme_extension.dart';

class InputDateCustomizationItem extends StatelessWidget {
  final DateTime dateTime;
  final ValueChanged<DateTime> onDateTimeChanged;

  const InputDateCustomizationItem({
    required this.dateTime,
    required this.onDateTimeChanged,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(DateFormat.yMd().format(dateTime)),
          const Icon(Icons.date_range),
        ],
      ),
      onTap: () {
        showDatePicker(
          context: context,
          initialDate: dateTime,
          firstDate: DateTime(2019),
          lastDate: DateTime(2030),
          builder: (context, child) {
            return Theme(
              data: context.theme.copyWith(
                textTheme: const TextTheme(
                  headlineSmall: TextStyle(
                    fontFamily: AppFonts.inter,
                  ),
                  titleLarge: TextStyle(
                    fontFamily: AppFonts.inter,
                  ),
                  labelSmall: TextStyle(
                    fontFamily: AppFonts.inter,
                  ),
                ),
                colorScheme: const ColorScheme.light(
                  primary: AppColors.black,
                ),
                textButtonTheme: TextButtonThemeData(
                  style: TextButton.styleFrom(
                    foregroundColor: AppColors.black,
                    textStyle: context.theme.textTheme.titleMedium,
                  ),
                ),
              ),
              child: child!,
            );
          },
        ).then(
          (value) {
            if (value != null) {
              onDateTimeChanged(value);
            }
          },
        );
      },
    );
  }
}
