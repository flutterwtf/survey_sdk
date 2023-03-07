import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:survey_admin/presentation/app/di/injector.dart';
import 'package:survey_admin/presentation/app/localization/localizations.dart';
import 'package:survey_admin/presentation/pages/builder/builder_cubit.dart';
import 'package:survey_admin/presentation/pages/builder/builder_state.dart';
import 'package:survey_admin/presentation/utils/app_fonts.dart';
import 'package:survey_admin/presentation/utils/colors.dart';
import 'package:survey_admin/presentation/utils/constants/constants.dart';
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

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BuilderCubit, BuilderState>(
      bloc: _cubit,
      builder: (context, state) => Scaffold(
        appBar: AppBar(
          toolbarHeight: AppDimensions.appbarSize,
          backgroundColor: AppColors.white,
          shadowColor: AppColors.transparentW,
          centerTitle: true,
          title: const _BuilderPageTabBar(),
          actions: const [
            _CreateTab(),
            _PreviewTab(),
          ],
        ),
        body: Row(
          children: [
            QuestionList(
              cubit: _cubit,
            ),
            Expanded(
              child: PhoneView(
                child: DecoratedBox(
                  decoration: const BoxDecoration(
                    color: Colors.red,
                  ),
                  child: Builder(
                    builder: (context) {
                      switch (state.selectedQuestion.type) {
                        case QuestionTypes.slider:
                          return SliderQuestionPage(
                            data: state.selectedQuestion as SliderQuestionData,
                            onSend: (_) {},
                          );
                        case QuestionTypes.choice:
                          return ChoiceQuestionPage(
                            data: state.selectedQuestion as ChoiceQuestionData,
                            onSend: (_) {},
                          );
                        case QuestionTypes.intro:
                          return IntroQuestionPage(
                            data: state.selectedQuestion as IntroQuestionData,
                            onSend: (_) {},
                          );
                        case QuestionTypes.input:
                          return InputQuestionPage(
                            data: state.selectedQuestion as InputQuestionData,
                            onSend: (_) {},
                          );
                        default:
                          return Container(
                            color: Colors.red,
                          );
                      }
                    },
                  ),
                ),
              ),
            ),
            EditorBar(
              cubit: _cubit,
            ),
          ],
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
          padding: const EdgeInsets.only(
            right: AppDimensions.tabBarPadding,
          ),
          indicator: const UnderlineTabIndicator(
            borderSide: BorderSide(),
            insets: EdgeInsets.symmetric(
              horizontal: AppDimensions.margin4XL + AppDimensions.sizeM,
            ),
          ),
          unselectedLabelColor: AppColors.textGrey,
          indicatorColor: AppColors.black,
          labelColor: AppColors.text,
          labelStyle: context.theme.textTheme.titleMedium?.copyWith(
            fontWeight: AppFonts.weightBold,
          ),
          tabs: [
            Tab(text: context.localization.create),
            Tab(text: context.localization.preview),
          ],
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
        bottom: AppDimensions.margin2XS,
        top: AppDimensions.margin2XS,
        right: AppDimensions.margin2XL,
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
        bottom: AppDimensions.margin2XS,
        top: AppDimensions.margin2XS,
        right: AppDimensions.margin3XL,
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
