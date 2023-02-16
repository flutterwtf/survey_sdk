import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:survey_core/src/presentation/survey/survey_cubit.dart';
import 'package:survey_core/src/presentation/survey/survey_state.dart';

class Survey extends StatelessWidget {
  Survey({Key? key}) : super(key: key);

  final cubit = SurveyCubit();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SurveyCubit, SurveyState>(
      builder: (BuildContext context, state) {
        return Theme(data: state.themeData!, child: Container());
      },
    );
  }
}
