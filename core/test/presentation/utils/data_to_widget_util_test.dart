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

void main() {
  group('createWidget method', () {
    mockOnSend(String key, dynamic data) {}

    test('Call with SliderQuestionData', () async {
      const mockData = SliderQuestionData(
        minValue: 0,
        maxValue: 10,
        initialValue: 5,
        id: 0,
        title: 'title',
        subtitle: 'subtitle',
        typeQuestion: 'Slider',
        isSkip: false,
      );
      final widget = DataToWidgetUtil.createWidget(mockData, mockOnSend);

      expect(widget.runtimeType, SliderQuestionPage);
      expect((widget as SliderQuestionPage).data, mockData);
      expect(widget.onSend, mockOnSend);
    });

    test('Call with ChoiceQuestionData', () async {
      const mockData = ChoiceQuestionData(
        isMultipleChoice: true,
        options: ['option 1', 'option 2', 'option 3'],
        id: 0,
        title: 'title',
        subtitle: 'subtitle',
        typeQuestion: 'Choice',
        isSkip: false,
      );
      final widget = DataToWidgetUtil.createWidget(mockData, mockOnSend);

      expect(widget.runtimeType, ChoiceQuestionPage);
      expect((widget as ChoiceQuestionPage).data, mockData);
      expect(widget.onSend, mockOnSend);
    });

    test('Call with InputQuestionData', () async {
      final mockData = InputQuestionData(
        validator: DefaultValidator(),
        value: 5,
        id: 0,
        title: 'title',
        subtitle: 'subtitle',
        typeQuestion: 'Input',
        isSkip: false,
      );
      final widget = DataToWidgetUtil.createWidget(mockData, mockOnSend);

      expect(widget.runtimeType, InputQuestionPage);
      expect((widget as InputQuestionPage).data, mockData);
      expect(widget.onSend, mockOnSend);
    });

    test('Call with IntroQuestionData', () async {
      const mockData = IntroQuestionData(
        mainButtonTitle: 'button title',
        id: 0,
        title: 'title',
        subtitle: 'subtitle',
        typeQuestion: 'Input',
        isSkip: false,
      );
      final widget = DataToWidgetUtil.createWidget(mockData, mockOnSend);

      expect(widget.runtimeType, IntroQuestionPage);
      expect((widget as IntroQuestionPage).data, mockData);
      expect(widget.onSend, mockOnSend);
    });

    test('Call with bad QuestionData', () async {
      expect(
        () => DataToWidgetUtil.createWidget(_BadQuestionData(), mockOnSend),
        throwsException,
      );
    });
  });
}

class _BadQuestionData extends QuestionData {
  _BadQuestionData()
      : super(
          id: 0,
          title: 'title',
          subtitle: 'subtitle',
          typeQuestion: 'Bad',
          isSkip: true,
        );

  @override
  get theme => throw UnimplementedError();

  @override
  Map<String, dynamic> toJson() => throw UnimplementedError();

  @override
  String get type => throw UnimplementedError();
}
