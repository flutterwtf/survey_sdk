import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:survey_core/src/domain/entities/survey_data.dart';
import 'package:survey_core/src/domain/entities/themes/common_theme.dart';
import 'package:survey_core/src/domain/entities/themes/text_field_theme_data.dart';
import 'package:survey_core/src/presentation/survey/survey_cubit.dart';
import 'package:survey_core/src/presentation/survey/survey_state.dart';

import '../../utils/shared_mocks.mocks.dart';

// TODO(dev): add test save answer
void main() {
  group(
    'Survey cubit tests',
    () {
      final mockedSurveyRepo = MockSurveyDataRepositoryImpl();
      final surveyCubit = SurveyCubit(mockedSurveyRepo);

      test(
        'Get survey data',
        () {
          final currentState = surveyCubit.state;
          final surveyData = SurveyData(
            questions: [],
            commonTheme: CommonTheme(
              textFieldThemeData: const TextFieldThemeData.common(),
              sliderThemeData: const SliderThemeData(),
              textSelectionThemeData: const TextSelectionThemeData(),
            ),
          );
          when(mockedSurveyRepo.getSurveyData(''))
              .thenAnswer((_) => Future.value(surveyData));
          surveyCubit.initData('', null);
          if (currentState is SurveyLoadedState) {
            expect(currentState.surveyData, surveyData);
          }
        },
      );
    },
  );
}
