import 'package:flutter_test/flutter_test.dart';
import 'package:survey_core/src/domain/entities/question_types/choice_question_data.dart';
import 'package:survey_core/src/domain/entities/question_types/input_question_data.dart';
import 'package:survey_core/src/domain/entities/question_types/intro_question_data.dart';
import 'package:survey_core/src/domain/entities/question_types/question_data.dart';
import 'package:survey_core/src/domain/entities/question_types/slider_question_data.dart';
import 'package:survey_core/src/domain/entities/validator/input_validator.dart';
import 'package:survey_core/src/presentation/choice_question/choice_question_page.dart';
import 'package:survey_core/src/presentation/input_question/input_question_page.dart';
import 'package:survey_core/src/presentation/intro_question/intro_question_page.dart';
import 'package:survey_core/src/presentation/slider_question/slider_question_page.dart';
import 'package:survey_core/src/presentation/utils/data_to_widget_util.dart';

void _mockOnSend(dynamic data) {}

void main() {
  final mockSliderData = SliderQuestionData(
    minValue: 0,
    maxValue: 10,
    initialValue: 5,
    index: 0,
    title: 'title',
    subtitle: 'subtitle',
    isSkip: false,
  );
  final mockChoiceData = ChoiceQuestionData(
    isMultipleChoice: true,
    options: const ['option 1', 'option 2', 'option 3'],
    index: 0,
    title: 'title',
    subtitle: 'subtitle',
    isSkip: false,
  );
  final mockInputData = InputQuestionData(
    validator: DefaultValidator(),
    index: 0,
    title: 'title',
    subtitle: 'subtitle',
    isSkip: false,
  );
  final mockIntroData = IntroQuestionData(
    mainButtonTitle: 'button title',
    index: 0,
    title: 'title',
    subtitle: 'subtitle',
    isSkip: false,
  );

  group('createWidget method', () {
    test('Call with SliderQuestionData}', () async {
      final widget = DataToWidgetUtil.createWidget(mockSliderData, _mockOnSend);
      expect(widget.runtimeType, SliderQuestionPage);
      expect((widget as SliderQuestionPage).data, mockSliderData);
      expect(widget.onSend, _mockOnSend);
    });

    test('Call with ChoiceQuestionData', () async {
      final widget = DataToWidgetUtil.createWidget(mockChoiceData, _mockOnSend);

      expect(widget.runtimeType, ChoiceQuestionPage);
      expect((widget as ChoiceQuestionPage).data, mockChoiceData);
      expect(widget.onSend, _mockOnSend);
    });

    test('Call with InputQuestionData', () async {
      final widget = DataToWidgetUtil.createWidget(mockInputData, _mockOnSend);

      expect(widget.runtimeType, InputQuestionPage);
      expect((widget as InputQuestionPage).data, mockInputData);
      expect(widget.onSend, _mockOnSend);
    });

    test('Call with IntroQuestionData', () async {
      final widget = DataToWidgetUtil.createWidget(mockIntroData, _mockOnSend);

      expect(widget.runtimeType, IntroQuestionPage);
      expect((widget as IntroQuestionPage).data, mockIntroData);
      expect(widget.onSend, _mockOnSend);
    });

    test('Call with bad QuestionData', () async {
      expect(
        () => DataToWidgetUtil.createWidget(_BadQuestionData(), _mockOnSend),
        throwsException,
      );
    });
  });
}

class _BadQuestionData extends QuestionData {
  _BadQuestionData()
      : super(
          index: 0,
          title: 'title',
          subtitle: 'subtitle',
          isSkip: true,
        );

  @override
  get theme => throw UnimplementedError();

  @override
  Map<String, dynamic> toJson() => throw UnimplementedError();

  @override
  String get type => throw UnimplementedError();

  @override
  List<Object?> get props => [];

  @override
  QuestionData copyWith({
    int? index,
    String? title,
    String? subtitle,
    String? content,
    bool? isSkip,
  }) {
    throw UnimplementedError();
  }
}
