import 'package:survey_sdk/survey_sdk.dart';

extension SliderQuestionDataMapper on SliderQuestionData {
  static SliderQuestionData fromJson(Map<String, dynamic> json) {
    final theme = json['theme'];
    return SliderQuestionData(
      index: json['index'],
      minValue: json['minValue'],
      maxValue: json['maxValue'],
      divisions: json['divisions'],
      initialValue: json['initialValue'],
      title: json['title'],
      subtitle: json['subtitle'],
      isSkip: json['isSkip'],
      content: json['content'],
      theme: theme != null
          ? SliderQuestionTheme.fromJson(theme)
          : const SliderQuestionTheme.common(),
      secondaryButtonText: json['secondaryButtonText'],
      primaryButtonText: json['primaryButtonText'],
    );
  }

  Map<String, dynamic> toJson({dynamic commonTheme}) {
    late final SliderQuestionTheme? theme;
    //ignore: prefer-conditional-expressions
    if (commonTheme != null) {
      theme = commonTheme == this.theme ? null : this.theme;
    } else {
      theme = this.theme;
    }
    return {
      'index': index,
      'theme': theme?.toJson(),
      'minValue': minValue,
      'maxValue': maxValue,
      'divisions': divisions,
      'initialValue': initialValue,
      'title': title,
      'subtitle': subtitle,
      'type': type,
      'isSkip': isSkip,
      'content': content,
      'secondaryButtonText': secondaryButtonText,
      'primaryButtonText': primaryButtonText,
    };
  }
}
