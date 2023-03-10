import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:survey_admin/presentation/pages/builder/builder_state.dart';
import 'package:survey_core/survey_core.dart';

class BuilderCubit extends Cubit<BuilderState> {
  BuilderCubit()
      : super(
          BuilderState(
            selectedQuestion: null,
            surveyData: SurveyData(
              questions: [
                const SliderQuestionData(
                  minValue: 10,
                  maxValue: 100,
                  initialValue: 50,
                  index: 1,
                  title: 'Another title',
                  subtitle: 'Another subtitle',
                  isSkip: true,
                ),
              ],
              commonTheme: CommonTheme(
                textFieldThemeData: const TextFieldThemeData.common(),
                sliderThemeData: const SliderThemeData(),
              ),
            ),
          ),
        );

  void select(QuestionData data) => emit(
        state.copyWith(selectedQuestion: data),
      );
}
