import 'package:flutter/material.dart';
import 'package:survey_admin/presentation/utils/app_fonts.dart';
import 'package:survey_admin/presentation/utils/colors.dart';
import 'package:survey_admin/presentation/utils/constants/constants.dart';

class CustomizationPanelTab {
  final String title;
  final Widget child;

  CustomizationPanelTab({
    required this.title,
    required this.child,
  });
}

class CustomizationPanelTabManager extends StatefulWidget {
  final List<CustomizationPanelTab> pages;

  const CustomizationPanelTabManager({
    super.key,
    required this.pages,
  });

  @override
  State<CustomizationPanelTabManager> createState() =>
      _CustomizationPanelTabManagerState();
}

class _CustomizationPanelTabManagerState
    extends State<CustomizationPanelTabManager>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: widget.pages.length,
      vsync: this,
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: AppDimensions.surveyEditorTabBarHeight,
          child: Material(
            child: TabBar(
              controller: _tabController,
              labelColor: AppColors.black,
              labelStyle: const TextStyle(
                fontSize: AppFonts.sizeM,
                fontWeight: AppFonts.weightMedium,
                color: AppColors.black,
              ),
              unselectedLabelStyle: const TextStyle(
                fontSize: AppFonts.sizeM,
                fontWeight: AppFonts.weightMedium,
                color: Color(0xFF929292),
              ),
              indicatorColor: AppColors.black,
              indicatorSize: TabBarIndicatorSize.label,
              tabs: widget.pages.map((page) => Tab(text: page.title)).toList(),
            ),
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height -
              AppDimensions.appbarSize -
              AppDimensions.surveyEditorTabBarHeight -
              1,
          child: TabBarView(
            controller: _tabController,
            children: widget.pages.map((page) => page.child).toList(),
          ),
        ),
      ],
    );
  }
}
