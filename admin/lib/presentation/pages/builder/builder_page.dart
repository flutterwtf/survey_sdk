import 'package:flutter/material.dart';
import 'package:survey_admin/presentation/app/localization/localizations.dart';
import 'package:survey_admin/presentation/utils/app_fonts.dart';
import 'package:survey_admin/presentation/utils/colors.dart';
import 'package:survey_admin/presentation/utils/constants/constants.dart';
import 'package:survey_admin/presentation/widgets/builder_page/phone_view.dart';
import 'package:survey_admin/presentation/widgets/builder_page/survey_content_bar.dart';
import 'package:survey_admin/presentation/widgets/builder_page/survey_editor_bar.dart';
import 'package:survey_admin/presentation/widgets/export_floating_window.dart';

class BuilderPage extends StatefulWidget {
  const BuilderPage({super.key});

  @override
  State<BuilderPage> createState() => _BuilderPageState();
}

class _BuilderPageState extends State<BuilderPage> {
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
    return DefaultTabController(
      length: 2,
      child: SizedBox(
        width: AppDimensions.tabBarWidth,
        child: TabBar(
          padding: const EdgeInsets.only(
            right: AppDimensions.tabBarPadding,
          ),
          indicator: const UnderlineTabIndicator(
            borderSide: BorderSide(width: 1.0),
            insets: EdgeInsets.symmetric(
              horizontal: AppDimensions.margin3XL + AppDimensions.sizeM,
            ),
          ),
          unselectedLabelColor: AppColors.textGrey,
          indicatorColor: AppColors.black,
          labelColor: AppColors.text,
          labelStyle: const TextStyle(fontWeight: AppFonts.weightBold),
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
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppDimensions.margin2XL,
          ),
          child: Text(
            context.localization.import,
            style: const TextStyle(
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
            horizontal: AppDimensions.margin2XL,
          ),
          child: Text(
            context.localization.export,
            style: const TextStyle(
              color: AppColors.white,
              fontWeight: AppFonts.weightSemiBold,
            ),
          ),
        ),
      ),
    );
  }
}
