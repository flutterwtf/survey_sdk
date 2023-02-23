import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:survey_core/src/domain/entities/question_types/slider_question_data.dart';
import 'package:survey_core/src/presentation/slider_question/slider_question_page.dart';
import 'package:survey_core/src/presentation/widgets/question_bottom_button.dart';

void main() {
  group(
    'Intro question widget test',
    () {
      final completerOnSendButtonTap = Completer<void>();
      const title = 'Question widget';
      const subTitle = 'Question widget subtitle';
      const typeQuestion = 'SliderQuestion';
      const minValue = 1.0;
      const maxValue = 2.0;
      const id = 1;
      const isSkip = false;

      final sliderQuestionPage = MaterialApp(
        supportedLocales: AppLocalizations.supportedLocales,
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        home: Scaffold(
          body: SliderQuestionPage(
            data: const SliderQuestionData(
              minValue: minValue,
              maxValue: maxValue,
              id: id,
              title: title,
              subtitle: subTitle,
              typeQuestion: typeQuestion,
              isSkip: isSkip,
            ),
            onSend: completerOnSendButtonTap.complete,
          ),
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
          await widgetTester.drag(find.byType(Slider), const Offset(50.0, 0.0));
          await widgetTester.pumpAndSettle();
          expect(find.byType(Slider), findsOneWidget);
        },
      );
    },
  );
}
