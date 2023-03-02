import 'package:survey_admin/presentation/utils/constants/image_constants.dart';
import 'package:survey_core/survey_core.dart';

enum NewQuestionTabs {
  intro,
  choice,
  slider,
  customInput,
}

extension NewQuestionTabsExt on NewQuestionTabs {
  String get name {
    switch (this) {
      case NewQuestionTabs.intro:
        return 'Intro';
      case NewQuestionTabs.choice:
        return 'Choice';
      case NewQuestionTabs.slider:
        return 'Slider';
      case NewQuestionTabs.customInput:
        return 'Custom input';
    }
  }

  QuestionData get data {
    switch (this) {
      case NewQuestionTabs.intro:
        return IntroQuestionData.common();
      case NewQuestionTabs.choice:
        return ChoiceQuestionData.common();
      case NewQuestionTabs.slider:
        return SliderQuestionData.common();
      case NewQuestionTabs.customInput:
        return InputQuestionData.common();
    }
  }

  List<NewQuestionOptions> get options {
    switch (this) {
      case NewQuestionTabs.intro:
        return [NewQuestionOptions.title, NewQuestionOptions.imageIntro];
      case NewQuestionTabs.choice:
        return [NewQuestionOptions.radioButton, NewQuestionOptions.checkBox];
      case NewQuestionTabs.slider:
        return [NewQuestionOptions.slider];
      case NewQuestionTabs.customInput:
        return [
          NewQuestionOptions.singleLineInput,
          NewQuestionOptions.multiLineInput
        ];
    }
  }
}

enum NewQuestionOptions {
  title,
  imageIntro,
  radioButton,
  slider,
  checkBox,
  singleLineInput,
  multiLineInput,
}

extension NewQuestionOptionsExt on NewQuestionOptions {
  String get name {
    switch (this) {
      case NewQuestionOptions.title:
        return 'Title';
      case NewQuestionOptions.imageIntro:
        return 'Image intro';
      case NewQuestionOptions.radioButton:
        return 'Radio button';
      case NewQuestionOptions.slider:
        return 'Slider';
      case NewQuestionOptions.checkBox:
        return 'Check box';
      case NewQuestionOptions.singleLineInput:
        return 'Single-line input';
      case NewQuestionOptions.multiLineInput:
        return 'Multi-line input';
    }
  }

  String get asset {
    switch (this) {
      case NewQuestionOptions.title:
        return AppAssets.introImage;
      case NewQuestionOptions.imageIntro:
        return AppAssets.imageIntroImage;
      case NewQuestionOptions.radioButton:
        return AppAssets.radioButtonImage;
      case NewQuestionOptions.slider:
        return AppAssets.sliderImage;
      case NewQuestionOptions.checkBox:
        return AppAssets.checkBoxImage;
      case NewQuestionOptions.singleLineInput:
        return AppAssets.singleLineInputImage;
      case NewQuestionOptions.multiLineInput:
        return AppAssets.multiLineInputImage;
    }
  }
}
