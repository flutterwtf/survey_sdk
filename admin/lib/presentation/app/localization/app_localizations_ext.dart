import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

// TODO(dev): write test for checking the point above.
extension AppLocalizationsExt on BuildContext {
  AppLocalizations get localization => AppLocalizations.of(this);
}
