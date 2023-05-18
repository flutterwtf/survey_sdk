import 'package:equatable/equatable.dart';
import 'package:survey_sdk/src/domain/entities/api_object.dart';
import 'package:survey_sdk/src/domain/entities/constants/validator_regexes.dart';
import 'package:survey_sdk/src/domain/entities/themes/input_question_theme.dart';

abstract class _ValidatorKeys {
  static const validator = 'validator';
  static const String regex = 'regex';
  static const isObscured = 'is_obscured';
  static const validatorError = 'Validation error';
}

/// Used to validate user input based on predefined rules for different types
/// of inputs in input question.
class InputValidator extends Equatable implements ApiObject {
  /// The type of the input being validated.
  late final InputType type;

  /// Determines if the input value should be obscured.
  late final bool? isObscured;

  /// The regular expression pattern used for input validation.
  late final String? _regex;

  /// Compiled `RegExp` object created from the [_regex] pattern.
  RegExp get _reg => RegExp(_regex ?? ValidatorRegexes.text);

  /// Validator with type [InputType.number].
  InputValidator.number({
    String? regex,
    bool? isObscured,
  }) {
    type = InputType.number;
    _regex = regex ?? ValidatorRegexes.number;
    this.isObscured = isObscured ?? false;
  }

  /// Validator with type [InputType.date].
  InputValidator.date({
    String? regex,
    bool? isObscured,
  }) {
    type = InputType.date;
    _regex = regex ?? ValidatorRegexes.text;
    this.isObscured = isObscured ?? false;
  }

  /// Validator with type [InputType.email].
  InputValidator.email({String? regex, bool? isObscured}) {
    type = InputType.email;
    _regex = regex ?? ValidatorRegexes.email;
    isObscured = isObscured ?? true;
  }

  /// Validator for with type [InputType.password].
  InputValidator.password({
    String? regex,
    bool? isObscured,
  }) {
    type = InputType.password;
    _regex = regex ?? ValidatorRegexes.password;
    this.isObscured = isObscured ?? true;
  }

  /// Validator with type [InputType.phone].
  InputValidator.phone({
    String? regex,
    bool? isObscured,
  }) {
    type = InputType.phone;
    _regex = regex ?? ValidatorRegexes.phone;
    this.isObscured = isObscured ?? false;
  }

  /// Validator with type [InputType.text].
  InputValidator.text({
    String? regex,
    bool? isObscured,
  }) {
    type = InputType.text;
    _regex = regex ?? ValidatorRegexes.text;
    this.isObscured = isObscured ?? false;
  }

  /// Creates the validator based on the given input type.
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

  /// If the input is valid, the method returns null, otherwise, it returns
  /// an error message.
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

  //ignore: member-ordering
  @override
  List<Object?> get props => [
        type,
        isObscured,
        _regex,
      ];
}
