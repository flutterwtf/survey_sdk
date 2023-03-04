part of 'input_validator.dart';

class NumberValidator implements InputValidator {
  const NumberValidator();

  RegExp get _reg => RegExp(r'^[0-9]+$');

  @override
  String get type => AppValidators.number;

  @override
  String? validate(String? input) {
    return input == null || _reg.hasMatch(input) ? null : _validatorErrorText;
  }

  @override
  Map<String, dynamic> toJson() => {_validatorName: type};
}
