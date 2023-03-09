part of 'input_validator.dart';

const String _defaultNumberValidatorRegExpStr = r'^[0-9]+$';

class NumberValidator implements InputValidator {
  String? _regex;
  bool? isHiddenInput;

  NumberValidator();

  NumberValidator.custom(this._regex, {this.isHiddenInput});

  RegExp get _reg => RegExp(_regex ?? _defaultNumberValidatorRegExpStr);

  @override
  String get type => AppValidators.number;

  @override
  bool get isHiddenInputFormat => false;

  @override
  String? validate(String? input) {
    return input == null || _reg.hasMatch(input) ? null : _validatorErrorText;
  }

  @override
  Map<String, dynamic> toJson() => {_validatorName: type};
}
