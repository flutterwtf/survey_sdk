import 'package:survey_sdk/survey_sdk.dart';

extension ChoiceQuestionDataMapper on ChoiceQuestionData {
  static ChoiceQuestionData fromJson(Map<String, dynamic> json) {
    final payload = json['payload'] as Map<String, dynamic>;
    final theme = json['theme'];
    return ChoiceQuestionData(
      index: json['index'],
      title: json['title'],
      subtitle: json['subtitle'],
      isSkip: json['isSkip'],
      content: json['content'],
      isMultipleChoice: payload['isMultipleChoice'],
      options: (payload['options'] as List<dynamic>).cast<String>(),
      selectedOptions: payload['selectedOptions'] != null
          ? (payload['selectedOptions'] as List<dynamic>).cast<int>()
          : null,
      ruleType: RuleType.values[payload['ruleType']],
      ruleValue: payload['ruleValue'],
      theme: theme != null
          ? ChoiceQuestionTheme.fromJson(theme)
          : const ChoiceQuestionTheme.common(),
      primaryButtonText: json['primaryButtonText'],
      secondaryButtonText: json['secondaryButtonText'],
    );
  }

  Map<String, dynamic> toJson({dynamic commonTheme}) {
    late final ChoiceQuestionTheme? theme;
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
      // TODO(dev): Do we need payload?
      // TODO(dev): Should we move keys to const?
      'payload': {
        'isMultipleChoice': isMultipleChoice,
        'options': options,
        'selectedOptions': selectedOptions,
        'ruleType': ruleType.index,
        'ruleValue': ruleValue,
      },
      'secondaryButtonText': secondaryButtonText,
      'primaryButtonText': primaryButtonText,
    };
  }
}
