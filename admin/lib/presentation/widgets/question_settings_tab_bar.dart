import 'package:flutter/material.dart';
import 'package:survey_admin/presentation/utils/app_text_styles.dart';
import 'package:survey_admin/presentation/utils/colors.dart';
import 'package:survey_admin/presentation/widgets/customization_panel/customization_panel.dart';

class QuestionSettingsTabBar extends StatefulWidget {
  final List<CustomizationPanel> panels;

  const QuestionSettingsTabBar({
    super.key,
    required this.panels,
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
      length: widget.panels.length,
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
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          TabBar(
            controller: _tabController,
            labelColor: AppColors.black,
            unselectedLabelColor: AppColors.customizationTabBarInactiveText,
            indicatorColor: AppColors.black,
            indicatorSize: TabBarIndicatorSize.label,
            labelStyle: AppTextStyles.interMMedium,
            tabs: [
              for (var panel in widget.panels) Tab(text: panel.title),
            ],
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: widget.panels,
            ),
          ),
        ],
      ),
    );
  }
}
