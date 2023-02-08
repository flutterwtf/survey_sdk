import 'package:flutter/material.dart';
import 'package:survey_sdk/presentation/base/base_page.dart';
import 'package:survey_sdk/presentation/pages/splash/splash_cubit.dart';

class SplashPage extends BasePage {
  const SplashPage({super.key});

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends BasePageState<SplashPage, SplashCubit> {

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}