import 'package:flutter_test/flutter_test.dart';
import 'package:survey_core/src/presentation/di/injector.dart';
import 'package:survey_core/src/presentation/survey/survey_state.dart';
import 'package:survey_core/survey_core.dart';

import '../presentation/widget/app_test.dart';
import '../utils/mocked_entities.dart';

void main() {
  group('Intro question page integration test', () {
    final app = AppTest(child: Survey(surveyData: MockedEntities.data2));
    testWidgets('next button intro click', (tester) async {
      await tester.pumpWidget(app);
      await tester.tap(find.text('Next'));
      final cubit = Injector().surveyCubit;
      expect((cubit.state as SurveyLoadedState).answers.length, 0);
    });
  });
}
