import 'package:flutter/material.dart';
import 'package:survey_admin/presentation/utils/app_fonts.dart';
import 'package:survey_admin/presentation/utils/colors.dart';
import 'package:survey_admin/presentation/utils/constants/constants.dart';
import 'package:survey_admin/presentation/widgets/builder_page/phone_redactor.dart';
import 'package:survey_admin/presentation/widgets/builder_page/phone_view.dart';
import 'package:survey_admin/presentation/widgets/builder_page/survey_questions.dart';

//TODO: rework phone widget
//TODO: recheck size constants
//TODO: recheck buttons
//TODO: rework tabs
//TODO: recheck left container
class BuilderPage extends StatefulWidget {
  const BuilderPage({super.key});

  @override
  State<BuilderPage> createState() => _BuilderPageState();
}

class _BuilderPageState extends State<BuilderPage> {
  static const double tabBarPadding = AppDimensions.margin3XL +
      AppDimensions.margin3XL +
      AppDimensions.margin2XS;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(AppDimensions.appbarSize),
          child: AppBar(
            toolbarHeight: AppDimensions.appbarSize,
            backgroundColor: AppColors.white,
            shadowColor: AppColors.transparentW,
            centerTitle: true,
            title: const SizedBox(
              width: 500,
              child: TabBar(
                padding: EdgeInsets.only(
                  right: tabBarPadding,
                ),
                indicator: UnderlineTabIndicator(
                  borderSide: BorderSide(width: 1.5),
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
            actions: [
              Padding(
                padding: const EdgeInsets.only(
                  top: AppDimensions.marginLargeM,
                  bottom: AppDimensions.marginLargeM,
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
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: AppDimensions.marginLargeM,
                  bottom: AppDimensions.marginLargeM,
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
              ),
            ],
          ),
        ),
        body: Row(
          children: const [
            SurveyQuestions(),
            Expanded(child: PhoneView()),
            PhoneRedactor(),
          ],
        ),
      ),
    );
  }
}
