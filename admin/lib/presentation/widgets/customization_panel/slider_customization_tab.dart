import 'package:flutter/material.dart';
import 'package:survey_admin/presentation/utils/colors.dart';
import 'package:survey_admin/presentation/widgets/customization_panel/common_customization_panel.dart';
import 'package:survey_admin/presentation/widgets/customization_panel/content_customization_panel.dart';
import 'package:survey_admin/presentation/widgets/customization_panel/slider_customization_panel.dart';

//TODO TabBarView
class SliderCustomizationTab extends StatelessWidget {
  final _sliderTab = const <Tab>[
    Tab(text: 'Common'),
    Tab(text: 'Slider'),
    Tab(text: 'Content'),
  ];

  const SliderCustomizationTab({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: DefaultTabController(
        length: _sliderTab.length,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: AppColors.white,
            toolbarHeight: 0,
            automaticallyImplyLeading: false,
            bottom: TabBar(
              indicatorColor: AppColors.white,
              unselectedLabelColor: AppColors.textLightGrey,
              labelColor: Colors.black,
              tabs: _sliderTab,
            ),
          ),
          body: TabBarView(
            children: [
              CommonCustomizationPanel(
                onButtonDownColorChanged: (value) {},
                onButtonUpColorChanged: (value) {},
                onFillColorChanged: (value) {},
                onSubtitleColorChanged: (value) {},
                onTitleColorChanged: (value) {},
              ),
              SliderCustomizationPanel(
                onActiveColorChanged: (value) {},
                onInactiveColorChanged: (value) {},
                onThicknessChanged: (value) {},
                onThumbChanged: (value) {},
                onThumbColorChanged: (value) {},
              ),
              ContentCustomizationPanel(
                onDivisionsChanged: (value) {},
                onMinMaxChanged: (min, max) {},
                onSubtitleChanged: (value) {},
                onTitleChanged: (value) {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
