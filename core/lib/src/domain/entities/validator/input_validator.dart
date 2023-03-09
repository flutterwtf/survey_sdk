import 'package:survey_core/src/domain/entities/api_object.dart';
import 'package:survey_core/src/presentation/utils/app_validators.dart';

part 'default_validator.dart';
part 'number_validator.dart';
part 'date_validator.dart';
part 'email_validator.dart';
part 'password_validator.dart';
part 'phone_validator.dart';

const String _validatorName = 'validator';
const String _regexName = 'regex';
const String _isHiddenInputName = 'is_hidden_input';
const String _validatorErrorText = 'error';

abstract class InputValidator implements ApiObject {
  String get type;
  bool get isHiddenInputFormat;

  String? validate(String? input);

  @override
  Map<String, dynamic> toJson();

  static InputValidator fromJson(Map<String, dynamic> json) {
    final String? type = json[_validatorName];
    final String? regex = json[_regexName];
    final bool? isHiddenInput = json[_isHiddenInputName];

    switch (type) {
      case AppValidators.number:
        return NumberValidator.custom(
          regex,
          isHiddenInput: isHiddenInput ?? false,
        );
      case AppValidators.date:
        return DateValidator.custom(
          regex,
          isHiddenInput: isHiddenInput ?? false,
        );
      case AppValidators.email:
        return EmailValidator.custom(
          regex,
          isHiddenInput: isHiddenInput ?? false,
        );
      case AppValidators.password:
        return PasswordValidator.custom(
          regex,
          isHiddenInput: isHiddenInput ?? true,
        );
      case AppValidators.phone:
        return PhoneValidator.custom(
          regex,
          isHiddenInput: isHiddenInput ?? false,
        );
      default:
        return const DefaultValidator();
    }
  }
}
