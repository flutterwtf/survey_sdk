import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:survey_admin/presentation/app/di/injector.dart';
import 'package:survey_admin/presentation/app/localization/app_localizations_ext.dart';
import 'package:survey_admin/presentation/pages/builder/builder_cubit.dart';
import 'package:survey_admin/presentation/pages/builder/builder_state.dart';
import 'package:survey_admin/presentation/utils/utils.dart';
import 'package:survey_admin/presentation/widgets/builder_page/editor_bar.dart';
import 'package:survey_admin/presentation/widgets/builder_page/phone_view.dart';
import 'package:survey_admin/presentation/widgets/builder_page/question_list.dart';
import 'package:survey_admin/presentation/widgets/export_floating_window.dart';
import 'package:survey_core/survey_core.dart';

class BuilderPage extends StatefulWidget {
  const BuilderPage({super.key});

  @override
  State<BuilderPage> createState() => _BuilderPageState();
}

class _BuilderPageState extends State<BuilderPage> {
  late final BuilderCubit _cubit;
  final _surveyController = SurveyController();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    initCommonData(context);
    _cubit = i.get<BuilderCubit>();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<BuilderCubit>(
      create: (context) => _cubit,
      child: BlocConsumer<BuilderCubit, BuilderState>(
        bloc: _cubit,
        listener: (oldState, newState) {
          final selected = (newState is EditQuestionBuilderState)
              ? newState.selectedIndex
              : 0;
          if (selected != 0) {
            _surveyController.animateTo(selected - 1);
          }
        },
        builder: (context, state) => Scaffold(
          appBar: AppBar(
            title: const _BuilderPageTabBar(),
            actions: const [_ImportButton(), _ExportButton()],
            centerTitle: true,
          ),
          body: Row(
            children: [
              QuestionList(
                onDelete: _cubit.deleteQuestionData,
                onSelect: _cubit.select,
                onAdd: _cubit.addQuestionData,
                questions: _cubit.state.surveyData.questions.isNotEmpty
                    ? List<QuestionData>.of(
                        _cubit.state.surveyData.questions,
                      )
                    : [],
              ),
              Expanded(
                child: PhoneView(
                  child: state.surveyData.questions.isNotEmpty
                      ? Survey(
                          surveyData: state.surveyData,
                          controller: _surveyController,
                        )
                      : const SizedBox.shrink(),
                ),
              ),
              EditorBar(
                onChange: _cubit.updateQuestionData,
                editableQuestion: (state is EditQuestionBuilderState &&
                        state.surveyData.questions.isNotEmpty)
                    ? state.surveyData.questions.firstWhere(
                        (q) => q.index == state.selectedIndex,
                      )
                    : null,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _BuilderPageTabBar extends StatelessWidget {
  const _BuilderPageTabBar();

  @override
  Widget build(BuildContext context) {
    const tabLength = 2;
    return DefaultTabController(
      length: tabLength,
      child: SizedBox(
        width: AppDimensions.tabBarWidth,
        child: TabBar(
          tabs: [
            Tab(text: context.localization.create),
            Tab(text: context.localization.preview),
          ],
          padding: const EdgeInsets.only(right: AppDimensions.tabBarPadding),
          indicator: const UnderlineTabIndicator(
            borderSide: BorderSide(),
            insets: EdgeInsets.symmetric(
              horizontal: AppDimensions.margin4XL + AppDimensions.sizeM,
            ),
          ),
          labelStyle: context.theme.textTheme.titleMedium
              ?.copyWith(fontWeight: AppFonts.weightBold),
        ),
      ),
    );
  }
}

class _ImportButton extends StatelessWidget {
  const _ImportButton();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: AppDimensions.margin2XS,
        right: AppDimensions.margin2XL,
        bottom: AppDimensions.margin2XS,
      ),
      child: OutlinedButton(
        onPressed: () {},
        style: OutlinedButton.styleFrom(
          side: const BorderSide(),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppDimensions.margin3XL,
          ),
          child: Text(
            context.localization.import,
            style: context.theme.textTheme.labelLarge?.copyWith(
              fontFamily: AppFonts.karla,
              color: AppColors.text,
            ),
          ),
        ),
      ),
    );
  }
}

class _ExportButton extends StatelessWidget {
  const _ExportButton();

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<BuilderCubit>(context);
    return Padding(
      padding: const EdgeInsets.only(
        top: AppDimensions.margin2XS,
        right: AppDimensions.margin3XL,
        bottom: AppDimensions.margin2XS,
      ),
      child: TextButton(
        onPressed: () {
          showExportFloatingWindow(
            context,
            onDownloadPressed: cubit.downloadSurveyData,
            onCopy: cubit.copySurveyData,
          );
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppDimensions.margin3XL,
          ),
          child: Text(
            context.localization.export,
            style: context.theme.textTheme.labelLarge?.copyWith(
              fontFamily: AppFonts.karla,
              color: AppColors.white,
            ),
          ),
        ),
      ),
    );
  }
}
