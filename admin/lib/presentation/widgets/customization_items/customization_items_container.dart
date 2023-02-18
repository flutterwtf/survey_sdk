import 'package:flutter/material.dart';
import 'package:survey_admin/presentation/utils/app_fonts.dart';
import 'package:survey_admin/presentation/utils/constants/constants.dart';
import 'package:survey_admin/presentation/widgets/customization_items/item_divider.dart';

class CustomizationItemsContainer extends StatefulWidget {
  final String? title;
  final EdgeInsets? padding;
  final double titleSeparatorHeight;
  final double itemSeparatorHeight;
  final bool isTopDividerShown;
  final bool isBottomDividerShown;
  final List<Widget> children;

  CustomizationItemsContainer({
    super.key,
    this.title,
    this.padding,
    this.titleSeparatorHeight = AppDimensions.marginLargeS,
    this.itemSeparatorHeight = AppDimensions.marginLargeS,
    this.isTopDividerShown = false,
    this.isBottomDividerShown = true,
    required this.children,
  }) : assert(children.isNotEmpty);

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

    if (widget.children.length > 1) {
      _items.add(_itemSeparator());

      for (int i = 1; i < widget.children.length - 1; i++) {
        _items.add(widget.children[i]);
        _items.add(_itemSeparator());
      }
      _items.add(widget.children.last);
    }
  }

  Widget _itemSeparator() => SizedBox(height: widget.itemSeparatorHeight);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (widget.isTopDividerShown) const ItemDivider(),
        Padding(
          padding: widget.padding ??
              const EdgeInsets.all(
                AppDimensions.marginM,
              ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (widget.title != null) ...[
                Text(
                  widget.title!,
                  style: const TextStyle(
                    fontSize: AppFonts.sizeM,
                    fontWeight: AppFonts.weightSemiBold,
                  ),
                ),
                SizedBox(
                  height: widget.titleSeparatorHeight,
                ),
              ],
              ..._items,
            ],
          ),
        ),
        if (widget.isBottomDividerShown) const ItemDivider(),
      ],
    );
  }
}
