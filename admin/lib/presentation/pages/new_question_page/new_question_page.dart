import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:survey_admin/presentation/app/di/injector.dart';
import 'package:survey_admin/presentation/app/localization/app_localizations_ext.dart';
import 'package:survey_admin/presentation/pages/new_question_page/new_question_cubit.dart';
import 'package:survey_admin/presentation/pages/new_question_page/new_question_state.dart';
import 'package:survey_admin/presentation/pages/new_question_page/new_question_tabs.dart';
import 'package:survey_admin/presentation/utils/utils.dart';
import 'package:survey_admin/presentation/widgets/editor_bar.dart';
import 'package:survey_admin/presentation/widgets/vector_image.dart';
import 'package:survey_sdk/survey_sdk.dart';

class NewQuestionPage extends StatelessWidget {
  final SurveyData data;

  const NewQuestionPage({required this.data, super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<NewQuestionCubit>(
      create: (_) => i.get<NewQuestionCubit>(param1: data),
      child: _Content(),
    );
  }
}

class _Content extends StatelessWidget {
  NewQuestionCubit cubit(BuildContext context) =>
      context.read<NewQuestionCubit>();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewQuestionCubit, NewQuestionState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: SurveyColors.white,
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(SurveyDimensions.appbarHeight),
            child: AppBar(
              automaticallyImplyLeading: false,
              title: const _AppBarTitle(),
              actions: [
                _BackButton(data: state.data),
              ],
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: SurveyDimensions.margin2XS,
              horizontal: SurveyDimensions.marginM,
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: NewQuestionTabs.values
                      .map(
                        (tab) => _TabButton(
                          onTap: () => cubit(context).selectTab(tab),
                          isSelected: state.selectedTab == tab,
                          title: tab.name(context),
                        ),
                      )
                      .toList(),
                ),
                _QuestionOptionsListView(
                  options: state.selectedTab.options,
                ),
                EditorBar(
                  onChange: cubit(context).updateData,
                  editableQuestion: state.selectedTab.data(state.data),
                ),
              ],
            ),
          ),
          persistentFooterButtons: [
            _CancelButton(
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            _AddButton(
              onPressed: () {
                final index = state.data.questions.length + 1;
                final question = state.selectedTab.data(state.data).copyWith(
                      index: index,
                    );
                state.data.questions.add(question);
                Navigator.pop(
                  context,
                  state.data,
                );
              },
            ),
          ],
        );
      },
    );
  }
}

class _BackButton extends StatelessWidget {
  final SurveyData data;

  const _BackButton({required this.data});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () => Navigator.pop(context, data),
      child: const Padding(
        padding: EdgeInsets.only(right: SurveyDimensions.marginL),
        child: VectorImage(assetName: AppAssets.closeIcon),
      ),
    );
  }
}

class _AppBarTitle extends StatelessWidget {
  const _AppBarTitle();

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        context.localization.newScreen,
        style: context.theme.textTheme.labelLarge?.copyWith(
          fontWeight: SurveyFonts.weightRegular,
        ),
      ),
    );
  }
}

class _TabButton extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final bool isSelected;

  const _TabButton({
    required this.title,
    required this.onTap,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    final titleMedium = context.theme.textTheme.titleMedium;
    return InkWell(
      onTap: onTap,
      borderRadius: const BorderRadius.all(Radius.circular(5)),
      child: SizedBox(
        width: SurveyDimensions.surveyContentBarWidth,
        child: ListTile(
          title: Text(
            title,
            style: isSelected
                ? titleMedium?.copyWith(
                    fontWeight: SurveyFonts.weightSemiBold,
                  )
                : titleMedium?.copyWith(
                    fontWeight: SurveyFonts.weightRegular,
                  ),
          ),
        ),
      ),
    );
  }
}

class _QuestionOptionsListView extends StatelessWidget {
  final List<NewQuestionOptions> options;

  const _QuestionOptionsListView({
    required this.options,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: FittedBox(
        fit: BoxFit.scaleDown,
        child: Row(
          children: [
            for (final option in options)
              _AssetTextOption(
                assetName: option.asset,
                titleText: option.name(context),
              ),
          ],
        ),
      ),
    );
  }
}

class _AssetTextOption extends StatelessWidget {
  final String assetName;
  final String titleText;

  const _AssetTextOption({
    required this.assetName,
    required this.titleText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: SurveyDimensions.margin4XL,
      ),
      padding: const EdgeInsets.all(SurveyDimensions.marginXS),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          VectorImage(assetName: assetName),
          const SizedBox(height: SurveyDimensions.marginXL),
          Text(
            titleText,
            style: context.theme.textTheme.titleMedium,
          ),
        ],
      ),
    );
  }
}

class _AddButton extends StatelessWidget {
  final VoidCallback onPressed;

  const _AddButton({
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: SurveyDimensions.addButtonWidth,
        height: SurveyDimensions.addButtonHeight,
        decoration: const BoxDecoration(
          color: SurveyColors.black,
          borderRadius: BorderRadius.all(
            Radius.circular(SurveyDimensions.circularRadiusXS),
          ),
        ),
        child: Center(
          child: Text(
            context.localization.add,
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

class _CancelButton extends StatelessWidget {
  final VoidCallback onPressed;

  const _CancelButton({
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: SurveyDimensions.addButtonWidth,
        height: SurveyDimensions.addButtonHeight,
        decoration: const BoxDecoration(
          color: SurveyColors.white,
          border: Border.fromBorderSide(BorderSide()),
          borderRadius: BorderRadius.all(
            Radius.circular(SurveyDimensions.circularRadiusXS),
          ),
        ),
        child: Center(
          child: Text(
            context.localization.cancel,
            style: context.theme.textTheme.labelLarge?.copyWith(
              fontFamily: SurveyFonts.karla,
              color: SurveyColors.black,
            ),
          ),
        ),
      ),
    );
  }
}
