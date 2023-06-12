import 'package:flutter/material.dart';
import 'package:survey_sdk/src/presentation/localization/flutter_gen/survey_localizations.dart';


extension SurveyLocalizationsExt on BuildContext {
  SurveyLocalizations get localization => SurveyLocalizations.of(this);
}
