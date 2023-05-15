import 'package:survey_sdk/survey_sdk.dart';

extension InputQuestionDataMapper on InputQuestionData {
  static InputQuestionData fromJson(Map<String, dynamic> json) {
    final Map<String, dynamic> payload = json['payload'];
    final theme = json['theme'];
    return InputQuestionData(
      index: json['index'],
      title: json['title'],
      subtitle: json['subtitle'],
      isSkip: json['isSkip'],
      content: json['content'],
      validator: InputValidator.fromJson(payload),
      hintText: payload['hintText'],
      secondaryButtonText: json['secondaryButtonText'],
      primaryButtonText: json['primaryButtonText'],
      theme: theme != null
          ? InputQuestionTheme.fromJson(theme)
          : const InputQuestionTheme.common(),
    );
  }

  Map<String, dynamic> toJson({dynamic commonTheme}) {
    late final InputQuestionTheme? theme;
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
      'payload': {
        ...validator.toJson(),
        'hintText': hintText,
      },
      'secondaryButtonText': secondaryButtonText,
      'primaryButtonText': primaryButtonText,
    };
  }
}
