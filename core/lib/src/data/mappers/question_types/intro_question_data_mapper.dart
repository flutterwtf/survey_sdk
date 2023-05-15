import 'package:survey_sdk/survey_sdk.dart';

extension IntroQuestionDataMapper on IntroQuestionData {
  static IntroQuestionData fromJson(Map<String, dynamic> json) {
    final theme = json['theme'];
    return IntroQuestionData(
      index: json['index'],
      title: json['title'],
      subtitle: json['subtitle'],
      isSkip: json['isSkip'],
      content: json['content'],
      theme: theme != null
          ? IntroQuestionTheme.fromJson(theme)
          : const IntroQuestionTheme.common(),
      secondaryButtonText: json['secondaryButtonText'],
      primaryButtonText: json['primaryButtonText'],
    );
  }

  Map<String, dynamic> toJson({dynamic commonTheme}) {
    late final IntroQuestionTheme? theme;
    //ignore: prefer-conditional-expressions
    if (commonTheme != null) {
      theme = commonTheme == this.theme ? null : this.theme;
    } else {
      theme = this.theme;
    }
    return {
      'index': index,
      'title': title,
      'subtitle': subtitle,
      'type': type,
      'isSkip': isSkip,
      'content': content,
      'theme': theme?.toJson(),
      'secondaryButtonText': secondaryButtonText,
      'primaryButtonText': primaryButtonText,
    };
  }
}
