import 'dart:math';

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
  late final SurveyController _surveyController;

  @override
  void initState() {
    super.initState();

    _surveyController = SurveyController();

    initCommonData(context);
  }

  Future<void> _showImportDialog() {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Text(context.localization.emptyDataMessage),
          actions: <Widget>[
            TextButton(
              child: Text(
                context.localization.ok,
                style: const TextStyle(
                  color: AppColors.white,
                ),
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }

  @override
  void dispose() {
    _surveyController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BuilderCubit, BuilderState>(
      listener: (_, newState) {
        if (newState is ImportErrorSurveyDataBuilderState) _showImportDialog();

        final selected =
            (newState is EditQuestionBuilderState) ? newState.selectedIndex : 0;
        if (selected != 0) {
          _surveyController.animateTo(selected - 1);
        }
      },
      builder: (_, state) {
        final cubit = context.read<BuilderCubit>();

        return Scaffold(
          appBar: AppBar(
            title: _BuilderPageTabBar(
              onTap: (tabIndex) => cubit.toggleMode(
                isEditMode: tabIndex == 0,
                selectedIndex:
                    (state as EditQuestionBuilderState).selectedIndex,
              ),
            ),
            actions: [
              // ignore: avoid-passing-async-when-sync-expected
              _ImportButton(onImportPressed: cubit.importData),
              _ExportButton(
                downloadSurveyData: cubit.downloadSurveyData,
                copySurveyData: cubit.copySurveyData,
              ),
            ],
            centerTitle: true,
          ),
          body: Row(
            children: [
              AnimatedSwitcher(
                duration: const Duration(milliseconds: 500),
                child: (state as EditQuestionBuilderState).isEditMode
                    ? QuestionList(
                        onDelete: cubit.deleteQuestionData,
                        onSelect: cubit.select,
                        onAdd: cubit.addQuestionData,
                        questions: cubit.state.surveyData.questions.isNotEmpty
                            ? List<QuestionData>.of(
                                cubit.state.surveyData.questions,
                              )
                            : [],
                        onUpdate: cubit.updateQuestions,
                        selectedIndex: state.selectedIndex - 1,
                      )
                    : Container(
                        color: AppColors.greyBackground,
                        width: AppDimensions.surveyContentBarWidth,
                      ),
              ),
              Expanded(
                child: PhoneView(
                  child: Survey(
                    surveyData: state.surveyData,
                    controller: _surveyController,
                  ),
                ),
              ),
              AnimatedSwitcher(
                duration: const Duration(milliseconds: 500),
                child: state.isEditMode
                    ? EditorBar(
                        onChange: cubit.updateQuestionData,
                        editableQuestion: state.surveyData.questions.isNotEmpty
                            ? state.surveyData.questions.firstWhere(
                                (q) => q.index == state.selectedIndex,
                              )
                            : null,
                      )
                    : Container(
                        color: AppColors.greyBackground,
                        width: min(
                          AppDimensions.surveyEditorBarWidth,
                          MediaQuery.of(context).size.width -
                              AppDimensions.surveyContentBarWidth,
                        ),
                      ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _BuilderPageTabBar extends StatelessWidget {
  final ValueChanged<int> onTap;

  const _BuilderPageTabBar({
    required this.onTap,
  });

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
          onTap: onTap,
        ),
      ),
    );
  }
}

class _ImportButton extends StatelessWidget {
  final VoidCallback onImportPressed;

  const _ImportButton({required this.onImportPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: AppDimensions.margin2XS,
        right: AppDimensions.margin2XL,
        bottom: AppDimensions.margin2XS,
      ),
      child: OutlinedButton(
        onPressed: onImportPressed,
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
  final VoidCallback downloadSurveyData;
  final VoidCallback copySurveyData;

  const _ExportButton({
    required this.downloadSurveyData,
    required this.copySurveyData,
  });

  @override
  Widget build(BuildContext context) {
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
            onDownloadPressed: downloadSurveyData,
            onCopy: copySurveyData,
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
