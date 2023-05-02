import 'package:flutter/material.dart';
import 'package:survey_admin/presentation/utils/utils.dart';

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
    this.itemsSeparatorHeight = AppDimensions.marginS,
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
                  left: AppDimensions.marginM,
                  top: AppDimensions.marginM,
                  right: AppDimensions.marginM,
                  bottom: AppDimensions.marginS,
                ),
            child: Text(
              title!,
              style: context.theme.textTheme.titleSmall,
            ),
          ),
        Padding(
          padding: itemsPadding ??
              const EdgeInsets.only(
                left: AppDimensions.marginM,
                right: AppDimensions.marginM,
                bottom: AppDimensions.marginM,
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
