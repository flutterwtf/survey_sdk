import 'package:flutter_test/flutter_test.dart';
import 'package:survey_sdk/src/domain/entities/actions/main_button_action/main_button_action.dart';
import 'package:survey_sdk/src/domain/entities/question_answer.dart';
import 'package:survey_sdk/src/domain/entities/question_types/choice_question_data.dart';
import 'package:survey_sdk/src/domain/entities/question_types/info_question_data.dart';
import 'package:survey_sdk/src/domain/entities/question_types/input_question_data.dart';
import 'package:survey_sdk/src/domain/entities/question_types/question_data.dart';
import 'package:survey_sdk/src/domain/entities/question_types/slider_question_data.dart';
import 'package:survey_sdk/src/presentation/choice_question/choice_question_page.dart';
import 'package:survey_sdk/src/presentation/info_question/info_question_page.dart';
import 'package:survey_sdk/src/presentation/input_question/input_question_page.dart';
import 'package:survey_sdk/src/presentation/slider_question/slider_question_page.dart';
import 'package:survey_sdk/src/presentation/utils/data_to_widget_util.dart';

//ignore: avoid-unused-parameters
void _mockOnSend({required int index, required QuestionAnswer answer}) {}

void main() {
  const mockSliderData = SliderQuestionData.common();
  const mockChoiceData = ChoiceQuestionData.common();
  final mockInputData = InputQuestionData.common();
  const mockInfoData = InfoQuestionData.common();

  group('createWidget method', () {
    test('Call with SliderQuestionData}', () {
      final widget = DataToWidgetUtil.createWidget(
        data: mockSliderData,
        onMainButtonTap: _mockOnSend,
        mainButtonCallback: () {},
        onGoNext: () {},
      );
      expect(widget.runtimeType, SliderQuestionPage);
      expect((widget as SliderQuestionPage).data, mockSliderData);
    });

    test('Call with ChoiceQuestionData', () {
      final widget = DataToWidgetUtil.createWidget(
        data: mockChoiceData,
        onMainButtonTap: _mockOnSend,
        mainButtonCallback: () {},
        onGoNext: () {},
      );

      expect(widget.runtimeType, ChoiceQuestionPage);
      expect((widget as ChoiceQuestionPage).data, mockChoiceData);
    });

    test('Call with InputQuestionData', () {
      final widget = DataToWidgetUtil.createWidget(
        data: mockInputData,
        onMainButtonTap: _mockOnSend,
        mainButtonCallback: () {},
        onGoNext: () {},
      );

      expect(widget.runtimeType, InputQuestionPage);
      expect((widget as InputQuestionPage).data, mockInputData);
    });

    test('Call with InfoQuestionData', () {
      final widget = DataToWidgetUtil.createWidget(
        data: mockInfoData,
        onMainButtonTap: _mockOnSend,
        mainButtonCallback: () {},
        onGoNext: () {},
      );

      expect(widget.runtimeType, InfoQuestionPage);
      expect((widget as InfoQuestionPage).data, mockInfoData);
    });

    test('Call with bad QuestionData', () {
      expect(
        () => DataToWidgetUtil.createWidget(
          data: const _BadQuestionData(),
          onMainButtonTap: _mockOnSend,
          mainButtonCallback: () {},
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
    MainButtonAction? mainButtonAction,
  }) {
    throw UnimplementedError();
  }
}
