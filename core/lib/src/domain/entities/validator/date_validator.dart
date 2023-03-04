part of 'input_validator.dart';

class DateValidator implements InputValidator {
  const DateValidator();

  RegExp get _reg => RegExp(
        r'^(3[01]|[12][0-9]|0?[1-9])/(1[0-2]|0?[1-9])/(?:[0-9]{2})?[0-9]{2}$',
      );

  @override
  String get type => AppValidators.date;

  @override
  String? validate(String? input) {
    return input == null || _reg.hasMatch(input) ? null : _validatorErrorText;
  }

  @override
  Map<String, dynamic> toJson() => {_validatorName: type};
}
