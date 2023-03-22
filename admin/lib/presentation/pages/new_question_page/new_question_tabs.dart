import 'package:flutter/cupertino.dart';
import 'package:survey_admin/presentation/app/di/injector.dart';
import 'package:survey_admin/presentation/app/localization/app_localizations_ext.dart';
import 'package:survey_admin/presentation/utils/common_data.dart';
import 'package:survey_admin/presentation/utils/constants/app_assets.dart';
import 'package:survey_core/survey_core.dart';

enum NewQuestionTabs {
  intro,
  choice,
  slider,
  customInput,
}

extension NewQuestionTabsExt on NewQuestionTabs {
  String name(BuildContext context) {
    switch (this) {
      case NewQuestionTabs.intro:
        return context.localization.intro;
      case NewQuestionTabs.choice:
        return context.localization.choice;
      case NewQuestionTabs.slider:
        return context.localization.slider;
      case NewQuestionTabs.customInput:
        return context.localization.custom_input;
    }
  }

  QuestionData data(BuildContext context) {
    switch (this) {
      case NewQuestionTabs.intro:
        return i.get<CommonData>().intro();
      case NewQuestionTabs.choice:
        return i.get<CommonData>().choice();
      case NewQuestionTabs.slider:
        return i.get<CommonData>().slider();
      case NewQuestionTabs.customInput:
        return i.get<CommonData>().input();
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
          NewQuestionOptions.multiLineInput,
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
  String name(BuildContext context) {
    switch (this) {
      case NewQuestionOptions.title:
        return context.localization.title;
      case NewQuestionOptions.imageIntro:
        return context.localization.image_intro;
      case NewQuestionOptions.radioButton:
        return context.localization.radio_button;
      case NewQuestionOptions.slider:
        return context.localization.slider;
      case NewQuestionOptions.checkBox:
        return context.localization.check_box;
      case NewQuestionOptions.singleLineInput:
        return context.localization.single_line_input;
      case NewQuestionOptions.multiLineInput:
        return context.localization.multi_line_input;
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
