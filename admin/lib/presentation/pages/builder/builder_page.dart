import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:survey_admin/presentation/app/di/injector.dart';
import 'package:survey_admin/presentation/app/localization/localizations.dart';
import 'package:survey_admin/presentation/pages/builder/builder_cubit.dart';
import 'package:survey_admin/presentation/pages/builder/builder_state.dart';
import 'package:survey_admin/presentation/utils/app_fonts.dart';
import 'package:survey_admin/presentation/utils/colors.dart';
import 'package:survey_admin/presentation/utils/constants/app_dimensions.dart';
import 'package:survey_admin/presentation/utils/theme_extension.dart';
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
  final _cubit = i.get<BuilderCubit>();
  final _surveyController = SurveyController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<BuilderCubit>(
      create: (context) => _cubit,
      child: BlocConsumer<BuilderCubit, BuilderState>(
        bloc: _cubit,
        listener: (oldState, newState) {
          final selected = newState.selectedQuestion;
          if (selected != null) {
            // TODO(dev): animate to edited
            //_surveyController.animateTo(selected.index - 1);
          }
        },
        builder: (context, state) => Scaffold(
          appBar: AppBar(
            title: const _BuilderPageTabBar(),
            actions: const [_CreateTab(), _PreviewTab()],
            shadowColor: AppColors.transparentW,
            backgroundColor: AppColors.white,
            centerTitle: true,
            toolbarHeight: AppDimensions.appbarHeight,
          ),
          body: Row(
            children: [
              QuestionList(
                onSelect: _cubit.select,
                onAdd: _cubit.addQuestionData,
                questions: List<QuestionData>.of(
                  _cubit.state.surveyData.questions,
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
              EditorBar(
                editableQuestion: state.selectedQuestion,
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
    return DefaultTabController(
      length: 2,
      child: SizedBox(
        width: AppDimensions.tabBarWidth,
        child: TabBar(
          tabs: [
            Tab(text: context.localization.create),
            Tab(text: context.localization.preview),
          ],
          padding: const EdgeInsets.only(right: AppDimensions.tabBarPadding),
          indicatorColor: AppColors.black,
          indicator: const UnderlineTabIndicator(
            borderSide: BorderSide(),
            insets: EdgeInsets.symmetric(
              horizontal: AppDimensions.margin4XL + AppDimensions.sizeM,
            ),
          ),
          labelColor: AppColors.text,
          labelStyle: context.theme.textTheme.titleMedium
              ?.copyWith(fontWeight: AppFonts.weightBold),
          unselectedLabelColor: AppColors.textGrey,
        ),
      ),
    );
  }
}

class _CreateTab extends StatelessWidget {
  const _CreateTab();

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

class _PreviewTab extends StatelessWidget {
  const _PreviewTab();

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
            onDownloadPressed: () {},
            onCopyPressed: () {},
          );
        },
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(AppColors.black),
        ),
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
