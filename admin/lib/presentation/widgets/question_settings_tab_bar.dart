import 'package:flutter/material.dart';
import 'package:survey_admin/presentation/utils/app_fonts.dart';
import 'package:survey_admin/presentation/utils/colors.dart';
import 'package:survey_admin/presentation/utils/theme_extension.dart';
import 'package:survey_admin/presentation/widgets/customization_panel/customization_tab.dart';

class QuestionSettingsTabBar extends StatefulWidget {
  final List<CustomizationTab> tabs;

  const QuestionSettingsTabBar({
    required this.tabs,
    super.key,
  });

  @override
  State<QuestionSettingsTabBar> createState() => _QuestionSettingsTabBarState();
}

class _QuestionSettingsTabBarState extends State<QuestionSettingsTabBar>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: widget.tabs.length,
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
        TabBar(
          controller: _tabController,
          labelColor: AppColors.black,
          unselectedLabelColor: AppColors.customizationTabBarInactiveText,
          indicatorColor: AppColors.black,
          indicatorSize: TabBarIndicatorSize.label,
          labelStyle: context.theme.textTheme.bodyMedium?.copyWith(
            fontWeight: AppFonts.weightMedium,
          ),
          tabs: [
            for (var tab in widget.tabs) Tab(text: tab.title),
          ],
        ),
        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: widget.tabs,
          ),
        ),
      ],
    );
  }
}
