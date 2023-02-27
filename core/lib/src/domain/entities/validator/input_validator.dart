abstract class InputValidator {
  String get type;

  String? validate(String? input);
}

class DefaultValidator implements InputValidator {
  @override
  String get type => 'default';

  @override
  String? validate(String? input) {
    return input == null || input.isNotEmpty ? null : 'Error';
  }
}

class NumberValidator implements InputValidator {
  RegExp get _reg => RegExp(r'^[0-9]+$');

  @override
  String get type => 'number';

  @override
  String? validate(String? input) {
    return input == null || _reg.hasMatch(input) ? null : 'Error';
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
