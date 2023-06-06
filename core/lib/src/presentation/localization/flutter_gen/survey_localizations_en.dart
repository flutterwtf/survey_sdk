import 'package:survey_sdk/src/presentation/localization/flutter_gen/survey_localizations.dart';

/// The translations for English (`en`).
class SurveyLocalizationsEn extends SurveyLocalizations {
  @override
  String get next => 'NEXT';

  @override
  String get skip => 'SKIP';

  @override
  String get textField => 'Text field';

  @override
  String get surveyLoadError => 'Survey has not been loaded';

  @override
  String get showErrorDetails => 'Show details';

  @override
  String get hideErrorDetails => 'Hide details';

  SurveyLocalizationsEn([super.locale = 'en']);
}
