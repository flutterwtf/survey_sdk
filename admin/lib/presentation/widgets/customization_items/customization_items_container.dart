import 'package:flutter/material.dart';
import 'package:survey_admin/presentation/utils/constants/app_dimensions.dart';
import 'package:survey_admin/presentation/utils/theme_extension.dart';
import 'package:survey_admin/presentation/widgets/customization_items/item_divider.dart';

class CustomizationItemsContainer extends StatefulWidget {
  final String? title;
  final EdgeInsets? titlePadding;
  final EdgeInsets? itemsPadding;
  final bool isFontBold;
  final double itemsSeparatorHeight;
  final bool isTopDividerShown;
  final bool isBottomDividerShown;
  final List<Widget> children;

  CustomizationItemsContainer({
    required this.children,
    this.title,
    this.titlePadding,
    this.itemsPadding,
    this.isFontBold = false,
    this.itemsSeparatorHeight = AppDimensions.marginS,
    this.isTopDividerShown = false,
    this.isBottomDividerShown = true,
    super.key,
  }) : assert(children.isNotEmpty, 'children must not be empty');

  @override
  State<CustomizationItemsContainer> createState() =>
      _CustomizationItemsContainerState();
}

class _CustomizationItemsContainerState
    extends State<CustomizationItemsContainer> {
  final List<Widget> _items = [];

  @override
  void initState() {
    super.initState();
    _items.add(widget.children.first);
    final length = widget.children.length;

    if (length > 1) {
      _items.add(_itemSeparator());

      for (var i = 1; i < length - 1; i++) {
        _items
          ..add(widget.children[i])
          ..add(_itemSeparator());
      }
      _items.add(widget.children.last);
    }
  }

  Widget _itemSeparator() => SizedBox(height: widget.itemsSeparatorHeight);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.isTopDividerShown) const ItemDivider(),
        if (widget.title != null)
          Padding(
            padding: widget.titlePadding ??
                const EdgeInsets.only(
                  left: AppDimensions.marginM,
                  top: AppDimensions.marginM,
                  right: AppDimensions.marginM,
                  bottom: AppDimensions.marginS,
                ),
            child: Text(
              widget.title!,
              style: context.theme.textTheme.titleSmall,
            ),
          ),
        Padding(
          padding: widget.itemsPadding ??
              const EdgeInsets.only(
                left: AppDimensions.marginM,
                right: AppDimensions.marginM,
                bottom: AppDimensions.marginM,
              ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: _items,
          ),
        ),
        if (widget.isBottomDividerShown) const ItemDivider(),
      ],
    );
  }
}
