import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

// TODO(dev): sort alphabetically all strings in .arb file.
// TODO(dev): write test for checking the point above.
// TODO(dev): we should use `camelCase` for localization ID.
extension AppLocalizationsExt on BuildContext {
  AppLocalizations get localization => AppLocalizations.of(this);
}
