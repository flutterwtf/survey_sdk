import 'package:flutter/material.dart';
import 'package:survey_admin/presentation/widgets/base/customization_tab.dart';
import 'package:survey_sdk/survey_sdk.dart';

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
        const Divider(),
        TabBar(
          controller: _tabController,
          labelStyle: context.theme.textTheme.bodyMedium?.copyWith(
            fontWeight: SurveyFonts.weightMedium,
          ),
          tabs: [
            for (final tab in widget.tabs) Tab(text: tab.title),
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
