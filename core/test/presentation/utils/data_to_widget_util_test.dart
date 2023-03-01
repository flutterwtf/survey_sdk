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
    mockOnSend(dynamic data) {}

    test('Call with SliderQuestionData', () async {
      final mockData = SliderQuestionData(
        minValue: 0,
        maxValue: 10,
        initialValue: 5,
        index: 0,
        title: 'title',
        subtitle: 'subtitle',
        isSkip: false,
      );
      final widget = DataToWidgetUtil.createWidget(mockData, mockOnSend);

      expect(widget.runtimeType, SliderQuestionPage);
      expect((widget as SliderQuestionPage).data, mockData);
      expect(widget.onSend, mockOnSend);
    });

    test('Call with ChoiceQuestionData', () async {
      final mockData = ChoiceQuestionData(
        isMultipleChoice: true,
        options: ['option 1', 'option 2', 'option 3'],
        index: 0,
        title: 'title',
        subtitle: 'subtitle',
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
        index: 0,
        title: 'title',
        subtitle: 'subtitle',
        isSkip: false,
      );
      final widget = DataToWidgetUtil.createWidget(mockData, mockOnSend);

      expect(widget.runtimeType, InputQuestionPage);
      expect((widget as InputQuestionPage).data, mockData);
      expect(widget.onSend, mockOnSend);
    });

    test('Call with IntroQuestionData', () async {
      final mockData = IntroQuestionData(
        mainButtonTitle: 'button title',
        index: 0,
        title: 'title',
        subtitle: 'subtitle',
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
}
