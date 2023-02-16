import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:survey_sdk/presentation/app/app_cubit.dart';
import 'package:survey_sdk/presentation/app/app_state.dart';
import 'package:survey_sdk/presentation/base/base_page.dart';
import 'package:survey_sdk/presentation/pages/builder/builder_page.dart';
import 'package:survey_sdk/presentation/theme/app_theme.dart';
import 'package:survey_sdk/presentation/theme/app_themes.dart';
import 'package:survey_sdk/presentation/theme/theme_extensions.dart';
import 'package:survey_sdk/presentation/theme/theme_provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:core/core.dart';

class App extends BasePage {
  const App({Key? key}) : super(key: key);

  @override
  _AppState createState() => _AppState();
}

class _AppState extends BasePageState<App, AppCubit>
    with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    cubit.onAppStarted();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {
        if (state.themeType == ThemeType.dark) {
          SystemChrome.setSystemUIOverlayStyle(
            SystemUiOverlayStyle.dark.copyWith(
              systemNavigationBarIconBrightness: Brightness.dark,
              systemNavigationBarColor: darkTheme.primaryBackgroundColor,
              statusBarColor: darkTheme.primaryBackgroundColor,
            ),
          );
        } else {
          SystemChrome.setSystemUIOverlayStyle(
            SystemUiOverlayStyle.light.copyWith(
              systemNavigationBarIconBrightness: Brightness.dark,
              systemNavigationBarColor: lightTheme.primaryBackgroundColor,
              statusBarColor: lightTheme.primaryBackgroundColor,
            ),
          );
        }
      },
      bloc: cubit,
      builder: (context, state) {
        final theme = _selectTheme(state.themeType);
        return ThemeProvider(
          theme: theme,
          child: Builder(
            builder: (context) {
              return MaterialApp(
                locale: state.locale,
                supportedLocales: AppLocalizations.supportedLocales,
                localizationsDelegates: const [
                  AppLocalizations.delegate,
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                ],
                home: const BuilderPage(),
                theme: context.theme.theme,
              );
            },
          ),
        );
      },
    );
  }

  AppTheme _selectTheme(ThemeType themeType) {
    if (themeType == ThemeType.system) {
      return MediaQueryData.fromWindow(WidgetsBinding.instance.window)
                  .platformBrightness ==
              Brightness.light
          ? lightTheme
          : darkTheme;
    } else {
      return themeType == ThemeType.dark ? darkTheme : lightTheme;
    }
  }
}
