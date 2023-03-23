import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:survey_admin/presentation/app/di/injector.dart';
import 'package:survey_admin/presentation/app/localization/localizations.dart';
import 'package:survey_admin/presentation/pages/builder/builder_cubit.dart';
import 'package:survey_admin/presentation/pages/builder/builder_state.dart';
import 'package:survey_admin/presentation/pages/new_question_page/new_question_tabs.dart';
import 'package:survey_admin/presentation/utils/app_fonts.dart';
import 'package:survey_admin/presentation/utils/colors.dart';
import 'package:survey_admin/presentation/utils/constants/app_assets.dart';
import 'package:survey_admin/presentation/utils/constants/app_dimensions.dart';
import 'package:survey_admin/presentation/utils/theme_extension.dart';
import 'package:survey_admin/presentation/widgets/builder_page/editor_bar.dart';
import 'package:survey_admin/presentation/widgets/vector_image.dart';
import 'package:survey_core/survey_core.dart';

class NewQuestionPage extends StatefulWidget {
  const NewQuestionPage({super.key});

  @override
  State<NewQuestionPage> createState() => _NewQuestionPageState();
}

class _NewQuestionPageState extends State<NewQuestionPage> {
  NewQuestionTabs _selectedTab = NewQuestionTabs.intro;
  String? _selectedOption;

  final _cubit = i.get<BuilderCubit>();

  Widget _questionTab(NewQuestionTabs tab) {
    return _TabButton(
      title: tab.name(context),
      onTap: () {
        setState(
          () => _selectedTab = tab,
        );
      },
      isSelected: _selectedTab == tab,
    );
  }

  QuestionData _selectCommon(BuilderState state, NewQuestionTabs tab) {
    switch (tab) {
      case NewQuestionTabs.intro:
        return state.commonIntro;
      case NewQuestionTabs.choice:
        return state.commonChoice;
      case NewQuestionTabs.slider:
        return state.commonSlider;
      case NewQuestionTabs.customInput:
        return state.commonInput;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BuilderCubit, BuilderState>(
      bloc: _cubit,
      builder: (context, state) {
        return Scaffold(
          backgroundColor: AppColors.white,
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(AppDimensions.appbarHeight),
            child: AppBar(
              automaticallyImplyLeading: false,
              title: const _AppBarTitle(),
              actions: const [
                _BackButton(),
              ],
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: AppDimensions.margin2XS,
              horizontal: AppDimensions.marginM,
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: NewQuestionTabs.values.map(_questionTab).toList(),
                ),
                Expanded(
                  child: _QuestionOptionsListView(
                    options: _selectedTab.options,
                    selectedOption: _selectedOption ?? '',
                  ),
                ),
                EditorBar(
                  onChange: _cubit.updateCommon,
                  editableQuestion: _selectCommon(state, _selectedTab),
                ),
              ],
            ),
          ),
          persistentFooterButtons: [
            _AddButton(
              onPressed: () {
                Navigator.pop(context, _selectedTab.data(context));
              },
            ),
          ],
        );
      },
    );
  }
}

class _BackButton extends StatelessWidget {
  const _BackButton();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pop(context),
      child: Container(
        margin: const EdgeInsets.only(right: AppDimensions.marginL),
        child: const Align(
          alignment: Alignment.centerRight,
          child: VectorImage(assetName: AppAssets.closeIcon),
        ),
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
        context.localization.new_screen,
        style: context.theme.textTheme.labelLarge?.copyWith(
          fontWeight: AppFonts.weightRegular,
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
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(5),
      child: SizedBox(
        width: AppDimensions.surveyContentBarWidth,
        child: ListTile(
          title: Text(
            title,
            style: isSelected
                ? context.theme.textTheme.titleMedium?.copyWith(
                    fontWeight: AppFonts.weightSemiBold,
                  )
                : context.theme.textTheme.titleMedium?.copyWith(
                    fontWeight: AppFonts.weightRegular,
                  ),
          ),
        ),
      ),
    );
  }
}

class _QuestionOptionsListView extends StatelessWidget {
  final List<NewQuestionOptions> options;
  final String selectedOption;

  const _QuestionOptionsListView({
    required this.options,
    required this.selectedOption,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: options.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return _AssetTextOption(
            assetName: options[index].asset,
            titleText: options[index].name(context),
          );
        },
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
      margin: const EdgeInsets.symmetric(horizontal: AppDimensions.margin4XL),
      padding: const EdgeInsets.all(AppDimensions.marginXS),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          VectorImage(assetName: assetName),
          const SizedBox(height: AppDimensions.marginXL),
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
        width: AppDimensions.addButtonWidth,
        height: AppDimensions.addButtonHeight,
        decoration: BoxDecoration(
          color: AppColors.black,
          borderRadius: BorderRadius.circular(AppDimensions.circularRadiusXS),
        ),
        child: Center(
          child: Text(
            'ADD',
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
