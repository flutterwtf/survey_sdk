import 'package:survey_sdk/src/presentation/localization/flutter_gen/survey_localizations.dart';

/// The translations for English (`en`).
class SurveyLocalizationsEn extends SurveyLocalizations {
  @override
  String get hideErrorDetails => 'Hide details';

  @override
  String get next => 'NEXT';

  @override
  String get showErrorDetails => 'Show details';

  @override
  String get showMoreErrorDetails => 'Show more details';

  @override
  String get skip => 'SKIP';

  @override
  String get surveyLoadError => 'Data is corrupted, survey has not been';

  @override
  String get textField => 'Text field';

  SurveyLocalizationsEn([super.locale = 'en']);
}
