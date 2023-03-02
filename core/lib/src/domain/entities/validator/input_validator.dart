import 'package:survey_core/src/domain/entities/api_object.dart';
import 'package:survey_core/src/presentation/utils/app_validators.dart';

part 'default_validator.dart';
part 'number_validator.dart';
part 'date_validator.dart';
part 'email_validator.dart';
part 'password_validator.dart';
part 'phone_validator.dart';

const String _validatorName = 'validator';
const String _validatorErrorText = 'validator';

abstract class InputValidator implements ApiObject {
  String get type;

  String? validate(String? input);

  @override
  Map<String, dynamic> toJson();

  static InputValidator fromJson(Map<String, dynamic> json) {
    String type = json[_validatorName];
    switch (type) {
      case AppValidators.number:
        return NumberValidator();
      case AppValidators.date:
        return DateValidator();
      case AppValidators.email:
        return EmailValidator();
      case AppValidators.password:
        return PasswordValidator();
      case AppValidators.phone:
        return PhoneValidator();
      default:
        return DefaultValidator();
    }
  }
}
