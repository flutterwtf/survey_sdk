import 'package:survey_sdk/src/domain/entities/question_types/choice_question_data.dart';

extension RuleTypeExtension on RuleType {
  bool canBeSend(int ruleValue, int value) {
    switch (this) {
      case RuleType.none:
        return true;
      case RuleType.less:
        return value < ruleValue;
      case RuleType.lessOrEqual:
        return value <= ruleValue;
      case RuleType.equal:
        return value == ruleValue;
      case RuleType.moreOrEqual:
        return value >= ruleValue;
      case RuleType.more:
        return value > ruleValue;
    }
  }
}
