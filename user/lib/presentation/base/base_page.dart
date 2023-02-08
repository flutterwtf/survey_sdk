import 'package:flutter/material.dart';
import 'package:survey_sdk/presentation/app/di/injector.dart';

import 'base_cubit.dart';

abstract class BasePage extends StatefulWidget {
  const BasePage({Key? key}) : super(key: key);

  @override
  BasePageState createState();
}

abstract class BasePageState<P extends BasePage, C extends BaseCubit> extends State<P> {
  @protected
  final cubit = i.get<C>();

  @override
  void initState() {
    super.initState();
    cubit.init();
  }

  @override
  void dispose() {
    super.dispose();
    cubit.dispose();
  }
}
