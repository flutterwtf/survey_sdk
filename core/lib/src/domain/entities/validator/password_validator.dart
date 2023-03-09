part of 'input_validator.dart';

const String _defaultPasswordValidatorRegExpStr =
    r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';

class PasswordValidator implements InputValidator {
  String? _regex;
  bool? isHiddenInput;

  PasswordValidator();

  PasswordValidator.custom(this._regex, {this.isHiddenInput});

  RegExp get _reg => RegExp(_regex ?? _defaultPasswordValidatorRegExpStr);

  @override
  String get type => AppValidators.password;

  @override
  bool get isHiddenInputFormat => true;

  @override
  String? validate(String? input) {
    return input == null || _reg.hasMatch(input) ? null : _validatorErrorText;
  }

  @override
  Map<String, dynamic> toJson() => {_validatorName: type};
}
