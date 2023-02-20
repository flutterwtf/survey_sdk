import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:survey_core/src/presentation/di/injector.dart';
import 'package:survey_core/src/presentation/survey/survey_cubit.dart';
import 'package:survey_core/src/presentation/survey/survey_state.dart';
import 'package:survey_core/src/presentation/utils/data_to_widget_util.dart';

class Survey extends StatefulWidget {
  final String surveyDataAsset;

  Survey({Key? key, required this.surveyDataAsset}) : super(key: key) {
    Injector().init();
  }

  @override
  State<Survey> createState() => _SurveyState();
}

class _SurveyState extends State<Survey> {
  final _cubit = Injector().surveyCubit;

  @override
  void initState() {
    _cubit.initData(widget.surveyDataAsset);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SurveyCubit, SurveyState>(
      bloc: _cubit,
      builder: (BuildContext context, state) {
        return state.surveyData == null
            //TODO: style the indicator
            ? const Center(child: CircularProgressIndicator())
            : Theme(
                data: state.surveyData!.commonTheme.toThemeData(),
                child: PageView(
                  children: state.surveyData!.questions
                      //TODO: <Widget> to superclass maybe
                      .map<Widget>(
                        (question) => DataToWidgetUtil.createWidget(
                          question,
                          (data) {},
                        ),
                      )
                      .toList(),
                ),
              );
      },
    );
  }
}
