import 'package:flutter_test/flutter_test.dart';
import 'package:survey_sdk/src/domain/entities/question_answer.dart';
import 'package:survey_sdk/src/domain/entities/question_types/choice_question_data.dart';
import 'package:survey_sdk/src/domain/entities/question_types/input_question_data.dart';
import 'package:survey_sdk/src/domain/entities/question_types/intro_question_data.dart';
import 'package:survey_sdk/src/domain/entities/question_types/question_data.dart';
import 'package:survey_sdk/src/domain/entities/question_types/slider_question_data.dart';
import 'package:survey_sdk/src/presentation/choice_question/choice_question_page.dart';
import 'package:survey_sdk/src/presentation/input_question/input_question_page.dart';
import 'package:survey_sdk/src/presentation/intro_question/intro_question_page.dart';
import 'package:survey_sdk/src/presentation/slider_question/slider_question_page.dart';
import 'package:survey_sdk/src/presentation/utils/data_to_widget_util.dart';

//ignore: avoid-unused-parameters
void _mockOnSend({required int index, required QuestionAnswer answer}) {}

void main() {
  const mockSliderData = SliderQuestionData.common();
  const mockChoiceData = ChoiceQuestionData.common();
  final mockInputData = InputQuestionData.common();
  const mockIntroData = IntroQuestionData.common();

  group('createWidget method', () {
    test('Call with SliderQuestionData}', () {
      final widget = DataToWidgetUtil.createWidget(
        data: mockSliderData,
        onSend: _mockOnSend,
        onGoNext: () {},
      );
      expect(widget.runtimeType, SliderQuestionPage);
      expect((widget as SliderQuestionPage).data, mockSliderData);
      expect(widget.onSend, _mockOnSend);
    });

    test('Call with ChoiceQuestionData', () {
      final widget = DataToWidgetUtil.createWidget(
        data: mockChoiceData,
        onSend: _mockOnSend,
        onGoNext: () {},
      );

      expect(widget.runtimeType, ChoiceQuestionPage);
      expect((widget as ChoiceQuestionPage).data, mockChoiceData);
      expect(widget.onSend, _mockOnSend);
    });

    test('Call with InputQuestionData', () {
      final widget = DataToWidgetUtil.createWidget(
        data: mockInputData,
        onSend: _mockOnSend,
        onGoNext: () {},
      );

      expect(widget.runtimeType, InputQuestionPage);
      expect((widget as InputQuestionPage).data, mockInputData);
      expect(widget.onSend, _mockOnSend);
    });

    test('Call with IntroQuestionData', () {
      final widget = DataToWidgetUtil.createWidget(
        data: mockIntroData,
        onSend: _mockOnSend,
        onGoNext: () {},
      );

      expect(widget.runtimeType, IntroQuestionPage);
      expect((widget as IntroQuestionPage).data, mockIntroData);
      expect(widget.onMainButtonTap, _mockOnSend);
    });

    test('Call with bad QuestionData', () {
      expect(
        () => DataToWidgetUtil.createWidget(
          data: const _BadQuestionData(),
          onSend: _mockOnSend,
          onGoNext: () {},
        ),
        throwsException,
      );
    });
  });
}

//ignore: prefer-match-file-name
class _BadQuestionData extends QuestionData {
  @override
  String get type => throw UnimplementedError();

  @override
  List<Object?> get props => [];

  const _BadQuestionData()
      : super(
          index: 0,
          title: 'title',
          subtitle: 'subtitle',
          isSkip: true,
          secondaryButtonText: 'SKIP',
          primaryButtonText: 'NEXT',
        );

  @override
  QuestionData copyWith({
    int? index,
    String? title,
    String? subtitle,
    String? content,
    bool? isSkip,
    String? secondaryButtonText,
    String? primaryButtonText,
  }) {
    throw UnimplementedError();
  }
}
