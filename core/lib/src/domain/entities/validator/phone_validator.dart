part of 'input_validator.dart';

// TODO(dev): check rege
const String _defaultPhoneValidatorRegExpStr =
    r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';

class PhoneValidator implements InputValidator {
  String? _regex;
  bool? isHiddenInput;

  PhoneValidator();

  PhoneValidator.custom(this._regex, {this.isHiddenInput});

  RegExp get _reg => RegExp(_regex ?? _defaultPhoneValidatorRegExpStr);

  @override
  String get type => AppValidators.phone;

  @override
  bool get isHiddenInputFormat => isHiddenInput ?? false;

  @override
  String? validate(String? input) {
    return input == null || _reg.hasMatch(input) ? null : _validatorErrorText;
  }

  @override
  Map<String, dynamic> toJson() => {_validatorName: type};
}
