import 'package:flutter/material.dart';
import 'package:survey_sdk/presentation/base/base_page.dart';
import 'package:survey_sdk/presentation/pages/builder/builder_cubit.dart';

class BuilderPage extends BasePage {
  const BuilderPage({super.key});

  @override
  _BuilderPageState createState() => _BuilderPageState();
}

class _BuilderPageState extends BasePageState<BuilderPage, BuilderCubit> {

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}