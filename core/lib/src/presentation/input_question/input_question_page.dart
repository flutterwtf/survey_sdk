import 'package:survey_core/src/domain/entities/validator/input_validator.dart';
import 'package:survey_core/src/presentation/localization/localizations.dart';
import 'package:survey_core/src/presentation/utils/app_fonts.dart';
import 'package:survey_core/src/presentation/utils/colors.dart';
import 'package:survey_core/src/presentation/utils/constants.dart';
import 'package:survey_core/src/presentation/widgets/question_bottom_button.dart';
import 'package:survey_core/src/presentation/widgets/question_subtitle.dart';
import 'package:survey_core/src/presentation/widgets/question_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class InputQuestionPage extends StatelessWidget {
  final String title;
  final String? subtitle;
  final VoidCallback onSend;
  final bool isSkip;
  final int? minLines;
  final int? maxLines;
  final Color backgroundColor;
  final Color borderColor;
  final double borderWidth;
  final double? verticalPadding;
  final double? horizontalPadding;
  final Color hintColor;
  final double hintSize;
  final String? hintText;
  final Color textColor;
  final double textSize;
  final InputValidator validator;

  const InputQuestionPage({
    super.key,
    required this.title,
    required this.onSend,
    required this.validator,
    this.subtitle,
    this.minLines,
    this.maxLines,
    this.verticalPadding,
    this.horizontalPadding,
    this.hintText,
    this.backgroundColor = Colors.white,
    this.borderColor = Colors.black,
    this.borderWidth = 1,
    this.hintColor = AppColors.textLightGrey,
    this.hintSize = AppFonts.sizeL,
    this.textColor = AppColors.black,
    this.textSize = AppFonts.sizeL,
    this.isSkip = false,
  });

  @override
  Widget build(BuildContext context) {
    final border = OutlineInputBorder(
      borderSide: BorderSide(
        color: borderColor,
        width: borderWidth,
      ),
      borderRadius: const BorderRadius.all(
        Radius.circular(
          AppDimensions.circularRadiusXS,
        ),
      ),
    );
    return Padding(
      padding: const EdgeInsets.only(
        left: AppDimensions.margin2XL,
        right: AppDimensions.margin2XL,
        top: AppDimensions.margin3XL,
        bottom: AppDimensions.marginXL,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          QuestionTitle(
            title: title,
          ),
          if (subtitle != null)
            Padding(
              padding: const EdgeInsets.only(
                top: AppDimensions.margin2XL,
              ),
              child: QuestionSubtitle(
                content: subtitle!,
              ),
            ),
          Padding(
            padding: const EdgeInsets.only(top: AppDimensions.marginM),
            //TODO: add validator?
            child: FormBuilderTextField(
              name: 'Text field',
              minLines: minLines,
              maxLines: maxLines,
              style: TextStyle(
                color: textColor,
                fontSize: textSize,
              ),
              decoration: InputDecoration(
                fillColor: backgroundColor,
                hintText: hintText ?? '',
                hintStyle: TextStyle(
                  color: hintColor,
                  fontSize: hintSize,
                ),
                enabledBorder: border,
                focusedBorder: border,
                border: border,
              ),
            ),
          ),
          const Spacer(),
          QuestionBottomButton(
            text: context.localization.next,
            onPressed: onSend,
            isEnabled: isSkip,
          ),
        ],
      ),
    );
  }
}
