import 'package:flutter/material.dart';
import 'package:survey_sdk/src/presentation/localization/flutter_gen/app_localizations.dart';


extension AppLocalizationsExt on BuildContext {
  AppLocalizations get localization => AppLocalizations.of(this);
}
