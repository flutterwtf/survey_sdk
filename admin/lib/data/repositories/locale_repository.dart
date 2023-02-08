import 'dart:ui';

import 'package:survey_sdk/data/data_sources/preferences_data_source.dart';
import 'package:survey_sdk/domain/data_interfaces/i_locale_repository.dart';

class LocaleRepositoryImpl implements LocaleRepository {
  final PreferencesDataSource _preferencesDataSource;

  LocaleRepositoryImpl(this._preferencesDataSource);

  @override
  Future<Locale?> getLocale() async {
    return await _preferencesDataSource.getLocale();
  }

  @override
  void saveLocale(Locale locale) {
    _preferencesDataSource.saveLocale(locale);
  }
}
