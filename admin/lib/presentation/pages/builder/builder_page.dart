import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:survey_admin/presentation/app/di/injector.dart';
import 'package:survey_admin/presentation/app/localization/app_localizations_ext.dart';
import 'package:survey_admin/presentation/pages/builder/builder_cubit.dart';
import 'package:survey_admin/presentation/pages/builder/builder_state.dart';
import 'package:survey_admin/presentation/widgets/builder_page/editor_bar.dart';
import 'package:survey_admin/presentation/widgets/builder_page/phone_view.dart';
import 'package:survey_admin/presentation/widgets/builder_page/question_list.dart';
import 'package:survey_admin/presentation/widgets/export_floating_window.dart';
import 'package:survey_sdk/survey_sdk.dart';

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
                  color: SurveyColors.white,
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

  QuestionData? _editableQuestion(BuilderState state) {
    if (state is EditQuestionBuilderState) {
      return state.selectedIndex == state.surveyData.endPage.index
          ? state.surveyData.endPage
          : state.surveyData.questions
              .firstWhereOrNull((q) => q.index == state.selectedIndex);
    } else if (state is PreviewQuestionBuilderState) {
      return state.selectedQuestion;
    } else {
      return null;
    }
  }

  int? _selectedIndex(BuilderState state) {
    if (state is EditQuestionBuilderState) {
      return state.selectedIndex - 1;
    } else if (state is PreviewQuestionBuilderState) {
      final index = state.selectedQuestion?.index;
      return index != null ? index - 1 : null;
    } else {
      return null;
    }
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
            newState is EditQuestionBuilderState ? newState.selectedIndex : 0;
        if (selected != 0) {
          _surveyController.animateTo(selected - 1);
        }
      },
      builder: (_, state) {
        final cubit = context.read<BuilderCubit>();

        return Scaffold(
          appBar: AppBar(
            title: _BuilderPageTabBar(
              onTapEditMode: cubit.openEditMode,
              onTapPreviewMode: cubit.openPreviewMode,
            ),
            actions: [
              // ignore: avoid-passing-async-when-sync-expected
              _ImportButton(onImportPressed: cubit.importData),
              _ExportButton(
                isButtonActive: cubit.state.surveyData.questions.isEmpty,
                downloadSurveyData: cubit.downloadSurveyData,
                copySurveyData: cubit.copySurveyData,
              ),
            ],
            centerTitle: true,
          ),
          body: Row(
            children: [
              QuestionList(
                isEditMode: state is EditQuestionBuilderState,
                onDelete: cubit.deleteQuestionData,
                onSelect: cubit.select,
                onAdd: cubit.addQuestionData,
                questions: state.surveyData.questions,
                endPage: state.surveyData.endPage,
                onUpdate: cubit.updateQuestions,
                selectedIndex: _selectedIndex(state),
              ),
              Expanded(
                child: PhoneView(
                  child: Survey(
                    surveyData: state.surveyData,
                    controller: _surveyController,
                  ),
                ),
              ),
              EditorBar(
                isEditMode: state is EditQuestionBuilderState,
                onChange: cubit.updateQuestionData,
                editableQuestion: _editableQuestion(state),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _BuilderPageTabBar extends StatelessWidget {
  final VoidCallback onTapEditMode;
  final VoidCallback onTapPreviewMode;

  const _BuilderPageTabBar({
    required this.onTapEditMode,
    required this.onTapPreviewMode,
  });

  @override
  Widget build(BuildContext context) {
    const previewTabIndex = 1;
    const tabLength = 2;

    return DefaultTabController(
      length: tabLength,
      child: SizedBox(
        width: SurveyDimensions.tabBarWidth,
        child: TabBar(
          tabs: [
            Tab(text: context.localization.create),
            Tab(text: context.localization.preview),
          ],
          padding: const EdgeInsets.only(right: SurveyDimensions.tabBarPadding),
          indicator: const UnderlineTabIndicator(
            borderSide: BorderSide(),
            insets: EdgeInsets.symmetric(
              horizontal: SurveyDimensions.margin4XL + SurveyDimensions.sizeM,
            ),
          ),
          labelStyle: context.theme.textTheme.titleMedium
              ?.copyWith(fontWeight: SurveyFonts.weightBold),
          onTap: (tabIndex) => tabIndex == previewTabIndex
              ? onTapPreviewMode()
              : onTapEditMode(),
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
        top: SurveyDimensions.margin2XS,
        right: SurveyDimensions.margin2XL,
        bottom: SurveyDimensions.margin2XS,
      ),
      child: OutlinedButton(
        onPressed: onImportPressed,
        style: OutlinedButton.styleFrom(
          side: const BorderSide(),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: SurveyDimensions.margin3XL,
          ),
          child: Text(
            context.localization.import,
            style: context.theme.textTheme.labelLarge?.copyWith(
              fontFamily: SurveyFonts.karla,
              color: SurveyColors.text,
            ),
          ),
        ),
      ),
    );
  }
}

class _ExportButton extends StatelessWidget {
  final bool isButtonActive;
  final VoidCallback downloadSurveyData;
  final VoidCallback copySurveyData;

  const _ExportButton({
    required this.isButtonActive,
    required this.downloadSurveyData,
    required this.copySurveyData,
  });

  Future<void> _errorExportDialog(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Text(context.localization.emptyQuestionMessage),
          actions: <Widget>[
            TextButton(
              child: Text(
                context.localization.ok,
                style: const TextStyle(
                  color: SurveyColors.white,
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
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: SurveyDimensions.margin2XS,
        right: SurveyDimensions.margin3XL,
        bottom: SurveyDimensions.margin2XS,
      ),
      child: TextButton(
        onPressed: isButtonActive
            ? () => _errorExportDialog(context)
            : () {
                showExportFloatingWindow(
                  context,
                  onDownloadPressed: downloadSurveyData,
                  onCopy: copySurveyData,
                );
              },
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: SurveyDimensions.margin3XL,
          ),
          child: Text(
            context.localization.export,
            style: context.theme.textTheme.labelLarge?.copyWith(
              fontFamily: SurveyFonts.karla,
              color: SurveyColors.white,
            ),
          ),
        ),
      ),
    );
  }
}
