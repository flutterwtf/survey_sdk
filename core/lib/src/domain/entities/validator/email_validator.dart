part of 'input_validator.dart';

const String _defaultEmailValidatorRegExpStr =
    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

class EmailValidator implements InputValidator {
  String? _regex;
  bool? isHiddenInput;

  EmailValidator();

  EmailValidator.custom(this._regex, {this.isHiddenInput});

  RegExp get _reg => RegExp(_regex ?? _defaultEmailValidatorRegExpStr);

  @override
  String get type => AppValidators.email;

  @override
  bool get isHiddenInputFormat => false;

  @override
  String? validate(String? input) {
    return input == null || _reg.hasMatch(input) ? null : _validatorErrorText;
  }

  @override
  Map<String, dynamic> toJson() => {_validatorName: type};
}
