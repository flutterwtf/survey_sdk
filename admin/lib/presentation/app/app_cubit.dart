import 'dart:ui';

import 'package:survey_sdk/domain/data_interfaces/locale_repository.dart';
import 'package:survey_sdk/domain/data_interfaces/theme_repository.dart';
import 'package:survey_sdk/domain/entities/theme_type.dart';

import '../base/base_cubit.dart';
import 'app_state.dart';

class AppCubit extends BaseCubit<AppState> {
  final ThemeRepository _themeRepository;
  final LocaleRepository _localeRepository;

  AppCubit(
    this._themeRepository,
    this._localeRepository,
  ) : super(
          const AppState(
            themeType: ThemeType.system,
            locale: null,
          ),
        );

  void _changeTheme(ThemeType themeType) {
    emit(state.copyWith(themeType: themeType));
  }

  void _changeLocale(Locale locale) {
    emit(state.copyWith(locale: locale));
  }

  void onAppStarted() async {
    _changeTheme(await _themeRepository.getTheme());
    final locale = await _localeRepository.getLocale();
    if (locale != null) {
      _changeLocale(locale);
    }
  }
}
