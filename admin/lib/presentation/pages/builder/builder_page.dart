import 'package:flutter/material.dart';
import 'package:survey_sdk/presentation/base/base_page.dart';
import 'package:survey_sdk/presentation/pages/builder/builder_cubit.dart';
import 'package:survey_sdk/presentation/utils/app_fonts.dart';
import 'package:survey_sdk/presentation/utils/colors.dart';
import 'package:survey_sdk/presentation/utils/constants/constants.dart';
import 'package:survey_sdk/presentation/widgets/builder_page/survey_editor_bar.dart';
import 'package:survey_sdk/presentation/widgets/builder_page/phone_view.dart';
import 'package:survey_sdk/presentation/widgets/builder_page/survey_content_bar.dart';

//TODO: rework phone widget
//TODO: recheck size constants
//TODO: recheck buttons
//TODO: rework tabs
//TODO: recheck left container
class BuilderPage extends BasePage {
  const BuilderPage({super.key});

  @override
  _BuilderPageState createState() => _BuilderPageState();
}

class _BuilderPageState extends BasePageState<BuilderPage, BuilderCubit> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        children: const [
          SurveyContentBar(),
          Expanded(child: PhoneView()),
          SurveyEditorBar(),
        ],
      ),
    );
  }
}

class _BuilderPageTabBar extends StatelessWidget {
  const _BuilderPageTabBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const DefaultTabController(
      length: 2,
      child: SizedBox(
        width: AppDimensions.tabBarWidth,
        child: TabBar(
          padding: EdgeInsets.only(
            right: AppDimensions.tabBarPadding,
          ),
          indicator: UnderlineTabIndicator(
            borderSide: BorderSide(width: 1.0),
            insets: EdgeInsets.symmetric(
              horizontal: AppDimensions.margin3XL + AppDimensions.sizeM,
            ),
          ),
          unselectedLabelColor: AppColors.textGrey,
          indicatorColor: AppColors.black,
          labelColor: AppColors.text,
          labelStyle: TextStyle(fontWeight: AppFonts.weightBold),
          tabs: [
            Tab(text: 'Create'),
            Tab(text: 'Preview'),
          ],
        ),
      ),
    );
  }
}

class _CreateTab extends StatelessWidget {
  const _CreateTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: AppDimensions.margin2XS,
        top: AppDimensions.margin2XS,
        right: AppDimensions.marginXL,
      ),
      child: OutlinedButton(
        onPressed: () {},
        style: OutlinedButton.styleFrom(
          side: const BorderSide(
            width: 1.0,
            color: AppColors.black,
          ),
        ),
        child: const Padding(
          padding: EdgeInsets.symmetric(
            horizontal: AppDimensions.margin2XL,
          ),
          child: Text(
            'IMPORT',
            style: TextStyle(
              color: AppColors.text,
              fontWeight: AppFonts.weightSemiBold,
            ),
          ),
        ),
      ),
    );
  }
}

class _PreviewTab extends StatelessWidget {
  const _PreviewTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: AppDimensions.margin2XS,
        top: AppDimensions.margin2XS,
        right: AppDimensions.margin2XL,
      ),
      child: TextButton(
        onPressed: () {},
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(AppColors.black),
        ),
        child: const Padding(
          padding: EdgeInsets.symmetric(
            horizontal: AppDimensions.margin2XL,
          ),
          child: Text(
            'EXPORT',
            style: TextStyle(
              color: AppColors.white,
              fontWeight: AppFonts.weightSemiBold,
            ),
          ),
        ),
      ),
    );
  }
}

