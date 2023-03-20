import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:survey_admin/presentation/app/di/injector.dart';
import 'package:survey_admin/presentation/pages/builder/builder_cubit.dart';

// TODO(dev): We should highlight this class. Maybe create
//  separate `base` folder for this and add documentation for this class
abstract class CustomizationTab extends StatefulWidget {
  final String title;

  const CustomizationTab({
    required this.title,
    super.key,
  });

  @override
  State<CustomizationTab> createState();
}

abstract class CustomizationTabState<P extends CustomizationTab>
    extends State<P> {
  @protected
  final cubit = i.get<BuilderCubit>();
}
