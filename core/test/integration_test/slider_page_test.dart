import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:survey_core/src/presentation/di/injector.dart';
import 'package:survey_core/src/presentation/survey/survey_state.dart';
import 'package:survey_core/survey_core.dart';

import '../presentation/widget/app_tester.dart';
import '../utils/mocked_entities.dart';

void main() {
  final app = AppTester(
    child: Survey(
      surveyData: MockedEntities.data2.copyWith(
        questions: [
          MockedEntities.slider3,
        ],
      ),
    ),
  );

  Future<void> moveSliderToValue(
    WidgetTester tester,
    int dragValue,
    double maxValue,
    double minValue,
  ) async {
    final slider = find.byType(Slider);
    expect(slider, findsOneWidget);
    final totalWidth = tester.getSize(slider).width;
    final zeroPoint = tester.getTopLeft(slider);
    final calculatedOffset = dragValue * (totalWidth / (maxValue - minValue));
    await tester.dragFrom(zeroPoint, Offset(calculatedOffset, 0));
    await tester.pumpAndSettle();
  }

  group(
    'Slider question page integration test',
    () {
      testWidgets(
        'move slider to 5',
        (tester) async {
          await tester.pumpWidget(app);
          final cubit = Injector().surveyCubit;
          await moveSliderToValue(tester, 5, 10, 0);
          await tester.tap(find.text('NEXT'));
          expect(
            (cubit.state as SurveyLoadedState).answers[0]?.answer,
            5,
          );
        },
      );

      testWidgets(
        'move slider to more then maxValue',
        (tester) async {
          await tester.pumpWidget(app);
          final cubit = Injector().surveyCubit;
          await moveSliderToValue(tester, 11, 10, 0);
          await tester.tap(find.text('NEXT'));
          expect(
            (cubit.state as SurveyLoadedState).answers[0]?.answer,
            10,
          );
        },
      );

      testWidgets(
        'move slider to less than minValue',
        (tester) async {
          await tester.pumpWidget(app);
          final cubit = Injector().surveyCubit;
          await moveSliderToValue(tester, -1, 10, 0);
          await tester.tap(find.text('NEXT'));
          expect(
            (cubit.state as SurveyLoadedState).answers[0]?.answer,
            0,
          );
        },
      );
    },
  );
}
