import 'package:flutter/material.dart';
import 'package:survey_sdk/survey_sdk.dart';

class CustomizationItemsContainer extends StatelessWidget {
  final String? title;
  final EdgeInsets? titlePadding;
  final EdgeInsets? itemsPadding;
  final bool isFontBold;
  final double itemsSeparatorHeight;
  final bool shouldShowTopDivider;
  final bool isBottomDividerShown;
  final List<Widget> children;

  CustomizationItemsContainer({
    required this.children,
    this.title,
    this.titlePadding,
    this.itemsPadding,
    this.isFontBold = false,
    this.itemsSeparatorHeight = SurveyDimensions.marginS,
    this.shouldShowTopDivider = false,
    this.isBottomDividerShown = true,
    super.key,
  }) : assert(children.isNotEmpty, 'children must not be empty');

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (shouldShowTopDivider) const Divider(),
        if (title != null)
          Padding(
            padding: titlePadding ??
                const EdgeInsets.only(
                  left: SurveyDimensions.marginM,
                  top: SurveyDimensions.marginM,
                  right: SurveyDimensions.marginM,
                  bottom: SurveyDimensions.marginS,
                ),
            child: Text(
              title!,
              style: context.theme.textTheme.titleSmall,
            ),
          ),
        Padding(
          padding: itemsPadding ??
              const EdgeInsets.only(
                left: SurveyDimensions.marginM,
                right: SurveyDimensions.marginM,
                bottom: SurveyDimensions.marginM,
              ),
          child: Wrap(
            runSpacing: itemsSeparatorHeight,
            children: children,
          ),
        ),
        if (isBottomDividerShown) const Divider(),
      ],
    );
  }
}
