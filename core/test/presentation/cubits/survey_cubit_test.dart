import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:survey_sdk/src/presentation/survey/survey_cubit.dart';
import 'package:survey_sdk/src/presentation/survey/survey_state.dart';
import 'package:survey_sdk/survey_sdk.dart';

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
            finalPage: const IntroQuestionData.common(),
            commonTheme: CommonTheme(
              slider: const SliderQuestionData.common(),
              choice: const ChoiceQuestionData.common(),
              input: InputQuestionData.common(),
              intro: const IntroQuestionData.common(),
            ),
          );
          when(mockedSurveyRepo.getSurveyData(''))
              .thenAnswer((_) => Future.value(surveyData));
          surveyCubit.initData('');
          if (currentState is SurveyLoadedState) {
            expect(currentState.surveyData, surveyData);
          }
        },
      );
    },
  );
}
