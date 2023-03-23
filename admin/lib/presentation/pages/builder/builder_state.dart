import 'package:equatable/equatable.dart';
import 'package:survey_core/survey_core.dart';

abstract class BuilderState extends Equatable {
  final IntroQuestionData commonIntro;
  final InputQuestionData commonInput;
  final SliderQuestionData commonSlider;
  final ChoiceQuestionData commonChoice;
  final SurveyData surveyData;

  const BuilderState({
    required this.surveyData,
    required this.commonChoice,
    required this.commonInput,
    required this.commonIntro,
    required this.commonSlider,
  });

  BuilderState copyWith({
    SurveyData? surveyData,
    IntroQuestionData? commonIntro,
    InputQuestionData? commonInput,
    SliderQuestionData? commonSlider,
    ChoiceQuestionData? commonChoice,
  });
}

class EditQuestionBuilderState extends BuilderState {
  final QuestionData? selectedQuestion;

  @override
  List<Object?> get props => [selectedQuestion, surveyData];

  const EditQuestionBuilderState({
    required this.selectedQuestion,
    required super.surveyData,
    required super.commonChoice,
    required super.commonInput,
    required super.commonIntro,
    required super.commonSlider,
  });

  @override
  BuilderState copyWith({
    QuestionData? selectedQuestion,
    SurveyData? surveyData,
    IntroQuestionData? commonIntro,
    InputQuestionData? commonInput,
    SliderQuestionData? commonSlider,
    ChoiceQuestionData? commonChoice,
  }) {
    return EditQuestionBuilderState(
      selectedQuestion: selectedQuestion ?? this.selectedQuestion,
      surveyData: surveyData ?? this.surveyData,
      commonChoice: commonChoice ?? this.commonChoice,
      commonInput: commonInput ?? this.commonInput,
      commonIntro: commonIntro ?? this.commonIntro,
      commonSlider: commonSlider ?? this.commonSlider,
    );
  }
}
