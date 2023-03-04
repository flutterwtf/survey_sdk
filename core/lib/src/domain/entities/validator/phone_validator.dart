part of 'input_validator.dart';

class PhoneValidator implements InputValidator {
  const PhoneValidator();

  // TODO(dev): check regex
  RegExp get _reg => RegExp(r'^(?:[+0])?[0-9]{10,12}$');

  @override
  String get type => AppValidators.phone;

  @override
  String? validate(String? input) {
    return input == null || _reg.hasMatch(input) ? null : _validatorErrorText;
  }

  @override
  Map<String, dynamic> toJson() => {_validatorName: type};
}
