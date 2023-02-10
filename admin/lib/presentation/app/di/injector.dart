import 'package:get_it/get_it.dart';

GetIt get i => GetIt.instance;

Future<void> initInjector() async {
  _initDataSources();
  _initRepositories();
}

Future<void> _initDataSources() async {}

void _initRepositories() {}
