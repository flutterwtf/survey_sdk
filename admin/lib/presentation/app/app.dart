import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:survey_admin/presentation/app/app_cubit.dart';
import 'package:survey_admin/presentation/app/app_state.dart';
import 'package:survey_admin/presentation/pages/builder/builder_page.dart';
import 'package:survey_admin/presentation/utils/app_fonts.dart';
import 'package:survey_admin/presentation/utils/colors.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<AppCubit>(
      create: (context) => AppCubit(),
      child: BlocBuilder<AppCubit, AppState>(
        builder: (context, state) {
          return MaterialApp(
            supportedLocales: AppLocalizations.supportedLocales,
            localizationsDelegates: const [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            theme: ThemeData(
              fontFamily: AppFonts.inter,
              textTheme: const TextTheme(
                titleMedium: TextStyle(color: AppColors.black),
                titleSmall: TextStyle(
                  color: AppColors.black,
                  fontWeight: AppFonts.weightSemiBold,
                ),
                bodyLarge: TextStyle(color: AppColors.black),
                bodyMedium: TextStyle(color: AppColors.black),
                bodySmall: TextStyle(color: AppColors.black),
                labelLarge: TextStyle(
                  color: AppColors.black,
                  fontWeight: AppFonts.weightBold,
                ),
              ),
            ),
            home: const BuilderPage(),
          );
        },
      ),
    );
  }
}
