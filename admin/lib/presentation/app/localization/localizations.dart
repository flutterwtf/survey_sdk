import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:survey_admin/presentation/widgets/customization_items/input_type_customization_item.dart';

// TODO(dev): sort alphabetically all strings in .arb file
// TODO(dev): write test for checking the point above
// TODO(dev): we should use `camelCase` for localization ID
extension AppLocalizationsExt on BuildContext {
  AppLocalizations get localization => AppLocalizations.of(this);

  String inputNameResolver(InputType inputType) {
    switch (inputType) {
      case InputType.number:
        return AppLocalizations.of(this).number;
      case InputType.date:
        return AppLocalizations.of(this).date;
      case InputType.email:
        return AppLocalizations.of(this).email;
      case InputType.password:
        return AppLocalizations.of(this).password;
      case InputType.phone:
        return AppLocalizations.of(this).phone;
      case InputType.text:
        return AppLocalizations.of(this).text;
    }
  }
}
