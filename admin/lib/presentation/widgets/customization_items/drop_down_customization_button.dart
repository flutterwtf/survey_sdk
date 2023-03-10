import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:survey_admin/presentation/utils/constants/app_assets.dart';
import 'package:survey_admin/presentation/utils/constants/app_durations.dart';
import 'package:survey_admin/presentation/utils/constants/constants.dart';

class DropdownCustomizationButton<T> extends StatefulWidget {
  final T initialValue;
  final List<DropdownCustomizationItem<T>> items;

  const DropdownCustomizationButton({
    required this.initialValue,
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
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              DropdownCustomizationItem<T>(
                value: widget.initialValue,
                child: widget.items
                    .where((element) => element.value == widget.initialValue)
                    .map((e) => e.child)
                    .first,
              ),
              RotationTransition(
                turns: _animation,
                child: SvgPicture.asset(AppAssets.arrowIcon),
              ),
            ],
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
                  children: widget.items
                      .where((element) => element.value != widget.initialValue)
                      .toList(),
                )
              : const SizedBox.shrink(),
        ),
      ],
    );
  }
}

class DropdownCustomizationItem<T> extends StatelessWidget {
  final Widget child;
  final T value;
  final void Function(T value)? onChange;

  const DropdownCustomizationItem({
    required this.child,
    required this.value,
    this.onChange,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onChange?.call(value),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: AppDimensions.margin2XS,
          horizontal: AppDimensions.marginM,
        ),
        child: child,
      ),
    );
  }
}
