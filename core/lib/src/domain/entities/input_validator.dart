import 'package:survey_core/src/domain/entities/api_object.dart';
import 'package:survey_core/src/domain/entities/constants/validator_regexes.dart';
import 'package:survey_core/src/domain/entities/question_types/input_question_data.dart';

const String _validatorKey = 'validator';
const String _regexKey = 'regex';
const String _isObscuredKey = 'is_obscured';
// TODO(dev): show error text
const String _validatorErrorText = 'error';

class InputValidator implements ApiObject {
  late final String? _regex;
  late final InputType type;
  late final bool? isObscured;

  InputValidator.number({
    String? regex,
    bool? isObscured,
  }) {
    type = InputType.number;
    _regex = regex ?? ValidatorDefaultRegexStrings.number;
    this.isObscured = isObscured ?? false;
  }

  InputValidator.date({
    String? regex,
    bool? isObscured,
  }) {
    type = InputType.date;
    _regex = regex ?? ValidatorDefaultRegexStrings.text;
    this.isObscured = isObscured ?? false;
  }

  InputValidator.email() {
    type = InputType.email;
    _regex = null;
    isObscured = null;
  }

  InputValidator.password({
    String? regex,
    bool? isObscured,
  }) {
    type = InputType.password;
    _regex = regex ?? ValidatorDefaultRegexStrings.password;
    this.isObscured = isObscured ?? true;
  }

  InputValidator.phone({
    String? regex,
    bool? isObscured,
  }) {
    type = InputType.phone;
    _regex = regex ?? ValidatorDefaultRegexStrings.phone;
    this.isObscured = isObscured ?? false;
  }

  InputValidator.text({
    String? regex,
    bool? isObscured,
  }) {
    type = InputType.text;
    _regex = regex ?? ValidatorDefaultRegexStrings.text;
    this.isObscured = isObscured ?? false;
  }

  factory InputValidator.fromType({
    required InputType type,
    String? regex,
    bool? isObscured,
  }) {
    switch (type) {
      case InputType.text:
        return InputValidator.text(regex: regex, isObscured: isObscured);
      case InputType.date:
        return InputValidator.date(regex: regex, isObscured: isObscured);
      case InputType.email:
        return InputValidator.email();
      case InputType.phone:
        return InputValidator.phone(regex: regex, isObscured: isObscured);
      case InputType.number:
        return InputValidator.number(
          regex: regex,
          isObscured: isObscured,
        );
      case InputType.password:
        return InputValidator.password(
          regex: regex,
          isObscured: isObscured,
        );
    }
  }

  factory InputValidator.fromJson(Map<String, dynamic> json) {
    final type = InputType.values[json[_validatorKey]];
    final String? regex = json[_regexKey];
    final bool? isObscured = json[_isObscuredKey];
    return InputValidator.fromType(
      type: type,
      regex: regex,
      isObscured: isObscured,
    );
  }

  RegExp get _reg => RegExp(_regex ?? ValidatorDefaultRegexStrings.text);

  String? validate(String? input) {
    return input == null || _reg.hasMatch(input) ? null : _validatorErrorText;
  }

  @override
  Map<String, dynamic> toJson() => {
        _validatorKey: type.index,
        _regexKey: _regex,
        _isObscuredKey: isObscured,
      };
}
