import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:survey_core/src/domain/entities/question_types/slider_question_data.dart';
import 'package:survey_core/src/presentation/slider_question/slider_question_page.dart';
import 'package:survey_core/src/presentation/widgets/question_bottom_button.dart';

import 'widget/app_test.dart';

void main() {
  group(
    'Slider question widget test',
    () {
      final completerOnSendButtonTap = Completer<void>();
      const title = 'Question widget';
      const subTitle = 'Question widget subtitle';
      const minValue = 1.0;
      const maxValue = 2.0;
      const initialValue = 1.0;
      const id = 1;
      const isSkip = false;

      final sliderQuestionPage = AppTest(
        child: SliderQuestionPage(
          data: const SliderQuestionData(
            minValue: minValue,
            maxValue: maxValue,
            index: id,
            title: title,
            subtitle: subTitle,
            isSkip: isSkip,
            initialValue: initialValue,
          ),
          onSend: ({data, String? key}) {
            completerOnSendButtonTap.complete();
          },
        ),
      );

      testWidgets(
        'All content widget test',
        (widgetTester) async {
          await widgetTester.pumpWidget(sliderQuestionPage);
          await widgetTester.pumpAndSettle();
          expect(find.text(title), findsOneWidget);
          expect(find.text(subTitle), findsOneWidget);
          expect(find.byType(QuestionBottomButton), findsOneWidget);
          expect(find.byType(Slider), findsOneWidget);
        },
      );
      testWidgets(
        'Button test',
        (widgetTester) async {
          await widgetTester.pumpWidget(sliderQuestionPage);
          await widgetTester.pumpAndSettle();
          await widgetTester.tap(find.byType(QuestionBottomButton));
          expect(completerOnSendButtonTap.isCompleted, isTrue);
        },
      );
      testWidgets(
        'Slider test',
        (widgetTester) async {
          await widgetTester.pumpWidget(sliderQuestionPage);
          await widgetTester.drag(find.byType(Slider), const Offset(50, 0));
          await widgetTester.pumpAndSettle();
          expect(find.byType(Slider), findsOneWidget);
        },
      );
      testWidgets(
        'Move slider to 1.5',
        (widgetTester) async {
          const dragValue = 0.5;
          final sliderQuestionPage = AppTest(
            child: SliderQuestionPage(
              data: const SliderQuestionData(
                minValue: minValue,
                maxValue: maxValue,
                index: id,
                title: title,
                subtitle: subTitle,
                isSkip: isSkip,
                initialValue: initialValue,
              ),
              onSend: ({data, String? key}) {
                expect(
                  (data as double).toStringAsFixed(1),
                  (dragValue + minValue).toStringAsFixed(1),
                );
                completerOnSendButtonTap.complete();
              },
            ),
          );
          await widgetTester.pumpWidget(sliderQuestionPage);
          final slider = find.byType(Slider);
          final totalWidth = widgetTester.getSize(slider).width;
          final zeroPoint = widgetTester.getTopLeft(slider);
          final calculatedOffset =
              dragValue * (totalWidth / (maxValue - minValue));
          await widgetTester.dragFrom(zeroPoint, Offset(calculatedOffset, 0));
          await widgetTester.pumpAndSettle();
          await widgetTester.tap(find.text('NEXT'));
        },
      );
      testWidgets(
        'Move slider to more then maxValue',
        (widgetTester) async {
          const dragValue = 2.0;
          final sliderQuestionPage = AppTest(
            child: SliderQuestionPage(
              data: const SliderQuestionData(
                minValue: minValue,
                maxValue: maxValue,
                index: id,
                title: title,
                subtitle: subTitle,
                isSkip: isSkip,
                initialValue: initialValue,
              ),
              onSend: ({data, String? key}) {
                expect(
                  (data as double).toStringAsFixed(1),
                  maxValue.toStringAsFixed(1),
                );
                completerOnSendButtonTap.complete();
              },
            ),
          );
          await widgetTester.pumpWidget(sliderQuestionPage);
          final slider = find.byType(Slider);
          final totalWidth = widgetTester.getSize(slider).width;
          final zeroPoint = widgetTester.getTopLeft(slider);
          final calculatedOffset =
              dragValue * (totalWidth / (maxValue - minValue));
          await widgetTester.dragFrom(zeroPoint, Offset(calculatedOffset, 0));
          await widgetTester.pumpAndSettle();
          await widgetTester.tap(find.text('NEXT'));
        },
      );
      testWidgets(
        'Move slider to less then minValue',
        (widgetTester) async {
          const dragValue = 1.0;
          final sliderQuestionPage = AppTest(
            child: SliderQuestionPage(
              data: const SliderQuestionData(
                minValue: minValue,
                maxValue: maxValue,
                index: id,
                title: title,
                subtitle: subTitle,
                isSkip: isSkip,
                initialValue: initialValue,
              ),
              onSend: ({data, String? key}) {
                expect(
                  (data as double).toStringAsFixed(1),
                  minValue.toStringAsFixed(1),
                );
                completerOnSendButtonTap.complete();
              },
            ),
          );
          await widgetTester.pumpWidget(sliderQuestionPage);
          final slider = find.byType(Slider);
          final totalWidth = widgetTester.getSize(slider).width;
          final zeroPoint = widgetTester.getTopLeft(slider);
          final calculatedOffset =
              dragValue * (totalWidth / (maxValue - minValue));
          await widgetTester.dragFrom(zeroPoint, Offset(-calculatedOffset, 0));
          await widgetTester.pumpAndSettle();
          await widgetTester.tap(find.text('NEXT'));
        },
      );
    },
  );
}
