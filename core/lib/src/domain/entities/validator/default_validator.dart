part of 'input_validator.dart';

class DefaultValidator implements InputValidator {
  const DefaultValidator();

  @override
  String get type => AppValidators.defaultName;

  @override
  String? validate(String? input) {
    return input == null || input.isNotEmpty ? null : _validatorErrorText;
  }

  @override
  Map<String, dynamic> toJson() => {_validatorName: type};
}
