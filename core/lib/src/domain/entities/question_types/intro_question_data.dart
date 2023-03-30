import 'package:survey_core/src/domain/entities/constants/question_types.dart';
import 'package:survey_core/src/domain/entities/question_types/question_data.dart';
import 'package:survey_core/src/domain/entities/themes/intro_question_theme.dart';

/// Contains the content for the introduction question
class IntroQuestionData extends QuestionData {
  /// Text to display on the main button
  final String mainButtonTitle;

  @override
  List<Object?> get props => [
        mainButtonTitle,
        index,
        title,
        subtitle,
        isSkip,
        content,
      ];

  @override
  IntroQuestionTheme? get theme => const IntroQuestionTheme.common();

  @override
  String get type => QuestionTypes.intro;

  const IntroQuestionData({
    required this.mainButtonTitle,
    required super.index,
    required super.title,
    required super.subtitle,
    required super.isSkip,
    super.content,
  });

  factory IntroQuestionData.fromJson(Map<String, dynamic> json) {
    final payload = json['payload'] as Map<String, dynamic>;
    return IntroQuestionData(
      index: json['index'],
      title: json['title'],
      subtitle: json['subtitle'],
      isSkip: json['isSkip'],
      content: json['content'],
      mainButtonTitle: payload['mainButtonTitle'],
    );
  }

  @override
  IntroQuestionData copyWith({
    String? mainButtonTitle,
    int? index,
    String? title,
    String? subtitle,
    String? content,
    bool? isSkip,
  }) {
    return IntroQuestionData(
      mainButtonTitle: mainButtonTitle ?? this.mainButtonTitle,
      index: index ?? this.index,
      title: title ?? this.title,
      subtitle: subtitle ?? this.subtitle,
      isSkip: isSkip ?? this.isSkip,
    );
  }

  @override
  Map<String, dynamic> toJson() => {
        'index': index,
        'title': title,
        'subtitle': subtitle,
        'type': type,
        'isSkip': isSkip,
        'content': content,
        'payload': {
          'mainButtonTitle': mainButtonTitle,
        },
      };
}
