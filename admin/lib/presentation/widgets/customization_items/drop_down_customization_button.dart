import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:survey_admin/presentation/utils/constants/app_assets.dart';
import 'package:survey_admin/presentation/utils/constants/app_durations.dart';
import 'package:survey_admin/presentation/utils/constants/constants.dart';
import 'package:survey_admin/presentation/widgets/customization_items/drop_down_customization_item.dart';

class DropdownCustomizationButton<T> extends StatefulWidget {
  final Widget child;
  final List<DropdownCustomizationItem<T>> items;

  const DropdownCustomizationButton({
    required this.child,
    required this.items,
    super.key,
  });

  @override
  State<DropdownCustomizationButton<T>> createState() =>
      _DropdownCustomizationButtonState<T>();
}

class _DropdownCustomizationButtonState<T>
    extends State<DropdownCustomizationButton<T>>
    with TickerProviderStateMixin {
  late bool _isOpen;
  late final AnimationController _iconAnimationController;
  late final Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _isOpen = false;
    _iconAnimationController = AnimationController(
      vsync: this,
      duration: AppDurations.customizationItemAnimation,
    );
    // ignore: prefer_int_literals
    _animation = Tween(begin: 0.0, end: .5).animate(
      CurvedAnimation(
        parent: _iconAnimationController,
        curve: Curves.easeOut,
      ),
    );
  }

  @override
  void dispose() {
    _iconAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: AppDimensions.margin2XS,
              horizontal: AppDimensions.marginM,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                widget.child,
                RotationTransition(
                  turns: _animation,
                  child: SvgPicture.asset(AppAssets.arrowIcon),
                ),
              ],
            ),
          ),
          onTap: () {
            setState(() {
              _isOpen = !_isOpen;
            });
            if (_isOpen) {
              _iconAnimationController.forward();
            } else {
              _iconAnimationController.reverse();
            }
          },
        ),
        AnimatedSize(
          duration: AppDurations.customizationItemAnimation,
          child: _isOpen
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: widget.items,
                )
              : const SizedBox.shrink(),
        ),
      ],
    );
  }
}
