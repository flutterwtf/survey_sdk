part of 'input_validator.dart';

const String _defaultDateValidatorRegExpStr =
    r'^(3[01]|[12][0-9]|0?[1-9])/(1[0-2]|0?[1-9])/(?:[0-9]{2})?[0-9]{2}$';

class DateValidator implements InputValidator {
  String? _regex;
  bool? isHiddenInput;

  DateValidator();

  DateValidator.custom(this._regex, {this.isHiddenInput});

  RegExp get _reg => RegExp(_regex ?? _defaultDateValidatorRegExpStr);

  @override
  String get type => AppValidators.date;

  @override
  bool get isHiddenInputFormat => isHiddenInput ?? false;

  @override
  String? validate(String? input) {
    return input == null || _reg.hasMatch(input) ? null : _validatorErrorText;
  }

  @override
  Map<String, dynamic> toJson() => {_validatorName: type};
}
