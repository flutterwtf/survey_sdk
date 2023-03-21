import 'package:survey_core/src/domain/entities/api_object.dart';
import 'package:survey_core/src/domain/entities/constants/validator_regexes.dart';
import 'package:survey_core/src/domain/entities/question_types/input_question_data.dart';

abstract class _ValidatorKeys {
  static const validator = 'validator';
  static const String regex = 'regex';
  static const isObscured = 'is_obscured';
  static const validatorError = 'Validation error';
}

class InputValidator implements ApiObject {
  late final InputType type;
  late final bool? isObscured;
  late final String? _regex;

  RegExp get _reg => RegExp(_regex ?? ValidatorRegexes.text);

  InputValidator.number({
    String? regex,
    bool? isObscured,
  }) {
    type = InputType.number;
    _regex = regex ?? ValidatorRegexes.number;
    this.isObscured = isObscured ?? false;
  }

  InputValidator.date({
    String? regex,
    bool? isObscured,
  }) {
    type = InputType.date;
    _regex = regex ?? ValidatorRegexes.text;
    this.isObscured = isObscured ?? false;
  }

  InputValidator.email() {
    type = InputType.email;
    _regex = null;
    isObscured = null;
  }

  InputValidator.password({
    String? regex,
    bool? isObscured,
  }) {
    type = InputType.password;
    _regex = regex ?? ValidatorRegexes.password;
    this.isObscured = isObscured ?? true;
  }

  InputValidator.phone({
    String? regex,
    bool? isObscured,
  }) {
    type = InputType.phone;
    _regex = regex ?? ValidatorRegexes.phone;
    this.isObscured = isObscured ?? false;
  }

  InputValidator.text({
    String? regex,
    bool? isObscured,
  }) {
    type = InputType.text;
    _regex = regex ?? ValidatorRegexes.text;
    this.isObscured = isObscured ?? false;
  }

  factory InputValidator.fromType({
    required InputType type,
    String? regex,
    bool? isObscured,
  }) {
    switch (type) {
      case InputType.text:
        return InputValidator.text(regex: regex, isObscured: isObscured);
      case InputType.date:
        return InputValidator.date(regex: regex, isObscured: isObscured);
      case InputType.email:
        return InputValidator.email();
      case InputType.phone:
        return InputValidator.phone(regex: regex, isObscured: isObscured);
      case InputType.number:
        return InputValidator.number(
          regex: regex,
          isObscured: isObscured,
        );
      case InputType.password:
        return InputValidator.password(
          regex: regex,
          isObscured: isObscured,
        );
    }
  }

  factory InputValidator.fromJson(Map<String, dynamic> json) {
    final type = InputType.values[json[_ValidatorKeys.validator]];
    final String? regex = json[_ValidatorKeys.regex];
    final bool? isObscured = json[_ValidatorKeys.isObscured];
    return InputValidator.fromType(
      type: type,
      regex: regex,
      isObscured: isObscured,
    );
  }

  String? validate(String? input) {
    return input == null || _reg.hasMatch(input)
        ? null
        : _ValidatorKeys.validatorError;
  }

  @override
  Map<String, dynamic> toJson() => {
        _ValidatorKeys.validator: type.index,
        _ValidatorKeys.regex: _regex,
        _ValidatorKeys.isObscured: isObscured,
      };
}
