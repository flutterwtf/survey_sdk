//TODO: Rewrite. Not a good solution
abstract class InputValidator {
  String get type;

  String? validate(String? input);
}

class DefaultValidator implements InputValidator {
  @override
  String get type => 'default';

  @override
  String? validate(String? input) {
    // TODO(dev): move strings to locale
    return input == null || input.isNotEmpty
        ? null
        : 'This field cannot be empty';
  }
}

class NumberValidator implements InputValidator {
  RegExp get _reg => RegExp(r'^[0-9]+$');

  @override
  String get type => 'number';

  @override
  String? validate(String? input) {
    // TODO(dev): move strings to locale
    if (input == null || input.isEmpty) {
      return 'This field cannot be empty';
    }
    return _reg.hasMatch(input) ? null : 'Please enter a valid number';
  }
}

abstract class JsonValidator {
  static InputValidator fromJson(Map<String, dynamic> json) {
    final type = json['validator'];
    if (type == 'number') return NumberValidator();
    return DefaultValidator();
  }

  static Map<String, dynamic> toJson(InputValidator validator) {
    return {
      'validator': validator.type,
    };
  }
}
