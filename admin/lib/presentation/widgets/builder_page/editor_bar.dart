import 'package:flutter/material.dart';
import 'package:survey_admin/presentation/pages/builder/builder_cubit.dart';
import 'package:survey_admin/presentation/utils/colors.dart';
import 'package:survey_admin/presentation/utils/constants/constants.dart';
import 'package:survey_admin/presentation/utils/question_data_transformers.dart';
import 'package:survey_admin/presentation/widgets/customization_panel/choice/choice_customization_panel.dart';
import 'package:survey_admin/presentation/widgets/customization_panel/input/input_customization_panel.dart';
import 'package:survey_admin/presentation/widgets/customization_panel/intro/intro_customization_panel.dart';
import 'package:survey_admin/presentation/widgets/customization_panel/slider/slider_customization_panel.dart';
import 'package:survey_core/survey_core.dart';

// TODO(dev): will we use this?
class EditorBar extends StatelessWidget {
  final BuilderCubit cubit;

  const EditorBar({
    required this.cubit,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.whitePrimaryBackground,
      width: AppDimensions.surveyEditorBarWidth,
      child: Builder(
        builder: (context) {
          switch (cubit.state.selectedQuestion.type) {
            case QuestionTypes.choice:
              return ChoiceCustomizationPanel(
                transformers: ChoiceQuestionTransformers(
                  question: cubit.state.selectedQuestion,
                  onTransformed: cubit.updateSelectedQuestion,
                ),
              );
            case QuestionTypes.input:
              return InputCustomizationPanel(
                transformers: InputQuestionTransformers(
                  question: cubit.state.selectedQuestion,
                  onTransformed: cubit.updateSelectedQuestion,
                ),
              );
            case QuestionTypes.intro:
              return IntroCustomizationPanel(
                transformers: IntroQuestionTransformers(
                  question: cubit.state.selectedQuestion,
                  onTransformed: cubit.updateSelectedQuestion,
                ),
              );
            case QuestionTypes.slider:
              return SliderCustomizationPanel(
                transformers: SliderQuestionTransformers(
                  question: cubit.state.selectedQuestion,
                  onTransformed: cubit.updateSelectedQuestion,
                ),
              );
            default:
              return const SizedBox.shrink();
          }
        },
      ),
    );
  }
}
