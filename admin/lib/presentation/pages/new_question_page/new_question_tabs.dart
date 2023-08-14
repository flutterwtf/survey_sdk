import 'package:flutter/cupertino.dart';
import 'package:survey_admin/presentation/app/localization/app_localizations_ext.dart';
import 'package:survey_admin/presentation/utils/utils.dart';
import 'package:survey_sdk/survey_sdk.dart';

enum NewQuestionTabs {
  info,
  choice,
  slider,
  customInput,
}

extension NewQuestionTabsExt on NewQuestionTabs {
  String name(BuildContext context) {
    switch (this) {
      case NewQuestionTabs.info:
        return context.localization.info;
      case NewQuestionTabs.choice:
        return context.localization.choice;
      case NewQuestionTabs.slider:
        return context.localization.slider;
      case NewQuestionTabs.customInput:
        return context.localization.customInput;
    }
  }

  QuestionData data(SurveyData data) {
    switch (this) {
      case NewQuestionTabs.info:
        return data.commonTheme.info;
      case NewQuestionTabs.choice:
        return data.commonTheme.choice;
      case NewQuestionTabs.slider:
        return data.commonTheme.slider;
      case NewQuestionTabs.customInput:
        return data.commonTheme.input;

    }
  }

  List<NewQuestionOptions> get options {
    switch (this) {
      case NewQuestionTabs.info:
        return [NewQuestionOptions.title];
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
      case NewQuestionOptions.radioButton:
        return context.localization.radioButton;
      case NewQuestionOptions.slider:
        return context.localization.slider;
      case NewQuestionOptions.checkBox:
        return context.localization.checkBox;
      case NewQuestionOptions.singleLineInput:
        return context.localization.singleLineInput;
      case NewQuestionOptions.multiLineInput:
        return context.localization.multiLineInput;
    }
  }

  String get asset {
    switch (this) {
      case NewQuestionOptions.title:
        return AppAssets.infoImage;
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
