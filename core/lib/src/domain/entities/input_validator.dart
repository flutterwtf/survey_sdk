import 'package:survey_core/src/domain/entities/api_object.dart';
import 'package:survey_core/src/domain/entities/constants/validator_regexes.dart';
import 'package:survey_core/src/domain/entities/constants/validator_types.dart';

const String _validatorName = 'validator';
const String _regexName = 'regex';
const String _isHiddenInputName = 'is_hidden_input';
const String _validatorErrorText = 'error';

class InputValidator implements ApiObject {
  late final String _regex;
  late final String name;
  late final bool isHiddenInput;

  InputValidator.number({
    String? regex,
    bool? isHiddenInput,
  }) {
    name = ValidatorTypes.number;
    _regex = regex ?? ValidatorDefaultRegexStrings.number;
    isHiddenInput = isHiddenInput ?? false;
  }

  InputValidator.date({
    String? regex,
    bool? isHiddenInput,
  }) {
    name = ValidatorTypes.date;
    _regex = regex ?? ValidatorDefaultRegexStrings.date;
    isHiddenInput = isHiddenInput ?? false;
  }

  InputValidator.email({
    String? regex,
    bool? isHiddenInput,
  }) {
    name = ValidatorTypes.email;
    _regex = regex ?? ValidatorDefaultRegexStrings.email;
    isHiddenInput = isHiddenInput ?? false;
  }

  InputValidator.password({
    String? regex,
    bool? isHiddenInput,
  }) {
    name = ValidatorTypes.password;
    _regex = regex ?? ValidatorDefaultRegexStrings.password;
    isHiddenInput = isHiddenInput ?? true;
  }

  InputValidator.phone({
    String? regex,
    bool? isHiddenInput,
  }) {
    name = ValidatorTypes.phone;
    _regex = regex ?? ValidatorDefaultRegexStrings.phone;
    isHiddenInput = isHiddenInput ?? false;
  }

  InputValidator.defaultInput({
    String? regex,
    bool? isHiddenInput,
  }) {
    name = ValidatorTypes.defaultName;
    _regex = regex ?? ValidatorDefaultRegexStrings.defaultRegex;
    isHiddenInput = isHiddenInput ?? false;
  }

  InputValidator.fromJson(Map<String, dynamic> json) {
    final String? type = json[_validatorName];
    final String? regex = json[_regexName];
    final bool? isHidden = json[_isHiddenInputName];
    switch (type) {
      case 'number':
        InputValidator.number(regex: regex, isHiddenInput: isHidden);
        break;
      case 'date':
        InputValidator.date(regex: regex, isHiddenInput: isHidden);
        break;
      case 'email':
        InputValidator.email(regex: regex, isHiddenInput: isHidden);
        break;
      case 'password':
        InputValidator.password(regex: regex, isHiddenInput: isHidden);
        break;
      case 'phone':
        InputValidator.phone(regex: regex, isHiddenInput: isHidden);
        break;
      default:
        InputValidator.defaultInput(regex: regex, isHiddenInput: isHidden);
        break;
    }
  }

  RegExp get _reg => RegExp(_regex);

  String? validate(String? input) {
    return input == null || _reg.hasMatch(input) ? null : _validatorErrorText;
  }

  @override
  Map<String, dynamic> toJson() => {_validatorName: name};
}
