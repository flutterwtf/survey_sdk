// TODO(dev): Rewrite. Not a good solution
abstract class InputValidator {
  String get type;

  String? validate(String? input);
}

class DefaultValidator implements InputValidator {
  const DefaultValidator();

  @override
  String get type => 'default';

  @override
  String? validate(String? input) {
    return input == null || input.isNotEmpty ? null : 'Error';
  }
}

class NumberValidator implements InputValidator {
  const NumberValidator();

  RegExp get _reg => RegExp(r'^[0-9]+$');

  @override
  String get type => 'number';

  @override
  String? validate(String? input) {
    return input == null || _reg.hasMatch(input) ? null : 'Error';
  }
}

abstract class JsonValidator {
  const JsonValidator();

  static InputValidator fromJson(Map<String, dynamic> json) {
    final type = json['validator'];
    if (type == 'number') return const NumberValidator();
    return const DefaultValidator();
  }

  static Map<String, dynamic> toJson(InputValidator validator) {
    return {
      'validator': validator.type,
    };
  }
}
