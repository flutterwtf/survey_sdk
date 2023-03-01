import 'package:survey_core/src/domain/entities/question_types/question_data.dart';
import 'package:survey_core/src/domain/entities/themes/intro_question_theme.dart';

class IntroQuestionData extends QuestionData {
  final String mainButtonTitle;
  final String? secondaryButtonTitle;

  const IntroQuestionData({
    required this.mainButtonTitle,
    required super.index,
    required super.title,
    required super.subtitle,
    required super.isSkip,
    super.content,
    this.secondaryButtonTitle,
  });

  @override
  IntroQuestionTheme? get theme => const IntroQuestionTheme.common();

  @override
  String get type => 'Intro';

  @override
  Map<String, dynamic> toJson() => {
        'index': index,
        'title': title,
        'subtitle': subtitle,
        'isSkip': isSkip,
        'payload': {
          'mainButtonTitle': mainButtonTitle,
          'secondaryButtonTitle': secondaryButtonTitle,
          'content': content,
        },
      };

  static IntroQuestionData fromJson(Map<String, dynamic> json) {
    final payload = json['payload'];
    return IntroQuestionData(
      index: json['index'],
      title: json['title'],
      subtitle: json['subtitle'],
      isSkip: json['isSkip'],
      mainButtonTitle: payload['mainButtonTitle'],
      secondaryButtonTitle: payload['secondaryButtonTitle'],
      content: payload['content'],
    );
  }
}
