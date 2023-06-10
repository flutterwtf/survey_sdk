import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:survey_sdk/src/data/repositories/survey_data_repository_impl.dart';
import 'package:survey_sdk/src/presentation/survey/survey_cubit.dart';
import 'package:survey_sdk/src/presentation/survey/survey_state.dart';
import 'package:survey_sdk/survey_sdk.dart';

// ignore: prefer-match-file-name
class MockSurveyDataRepository extends Mock
    implements SurveyDataRepositoryImpl {}

// TODO(dev): add test save answer
void main() {
  group(
    'Survey cubit tests',
    () {
      final mockedSurveyRepo = MockSurveyDataRepository();
      final surveyCubit = SurveyCubit(mockedSurveyRepo);

      test(
        'Get survey data',
        () {
          final currentState = surveyCubit.state;
          final surveyData = SurveyData(
            questions: [],
            endPage: const InfoQuestionData.common(),
            commonTheme: CommonTheme(
              slider: const SliderQuestionData.common(),
              choice: const ChoiceQuestionData.common(),
              input: InputQuestionData.common(),
              info: const InfoQuestionData.common(),
            ),
          );
          when(() => mockedSurveyRepo.getSurveyData(''))
              .thenAnswer((_) async => (surveyData, <String>[]));
          surveyCubit.initData('');
          if (currentState is SurveyLoadedState) {
            expect(currentState.surveyData, surveyData);
          }
        },
      );
    },
  );
}
