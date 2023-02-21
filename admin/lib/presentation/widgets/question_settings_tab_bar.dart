import 'package:flutter/material.dart';
import 'package:survey_sdk/presentation/utils/colors.dart';

//TODO: extend every customization from this
//TODO: rename to "CustomizationItem"
//TODO: store tab title here, not in 'titles' list
class QuestionSettingsListItem {
  final String title;
  final Widget body;

  QuestionSettingsListItem(this.title, this.body);
}

class QuestionSettingsTabBar extends StatelessWidget {
  final List<String> tabTitles;
  final List<QuestionSettingsListItem> questionSettings;
  final TabController tabController;

  const QuestionSettingsTabBar({
    required this.tabTitles,
    required this.questionSettings,
    required this.tabController,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        TabBar(
          controller: tabController,
          unselectedLabelColor: AppColors.black,
          indicatorColor: AppColors.black,
          tabs: <Widget>[
            for (var tabTitle in tabTitles) Tab(text: tabTitle),
          ],
        ),
        Expanded(
          child: ListView.separated(
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(questionSettings[index].title),
                subtitle: questionSettings[index].body,
              );
            },
            itemCount: questionSettings.length,
            separatorBuilder: (BuildContext context, int index) => const Divider(),
          ),
        ),
      ],
    );
  }
}
