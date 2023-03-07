import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:survey_admin/presentation/utils/constants/app_assets.dart';
import 'package:survey_admin/presentation/utils/constants/app_durations.dart';
import 'package:survey_admin/presentation/utils/constants/constants.dart';
import 'package:survey_admin/presentation/utils/theme_extension.dart';

class DropDownCustomizationItem<T> extends StatefulWidget {
  final T initialValue;
  final List<T> itemList;
  final void Function(T changeValue)? onChanged;

  const DropDownCustomizationItem({
    required this.initialValue,
    required this.onChanged,
    required this.itemList,
    super.key,
  });

  @override
  State<DropDownCustomizationItem<T>> createState() =>
      _DropDownCustomizationItemState<T>();
}

class _DropDownCustomizationItemState<T>
    extends State<DropDownCustomizationItem<T>>
    with SingleTickerProviderStateMixin {
  late bool _isExpanded;
  late T _selectedRule;
  late final AnimationController _iconAnimationController;
  late final Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _isExpanded = false;
    _selectedRule = widget.initialValue;
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
        _RulesItem(
          ruleType: (_selectedRule is Enum)
              ? (_selectedRule as Enum).name
              : _selectedRule.toString(),
          trailing: RotationTransition(
            turns: _animation,
            child: SvgPicture.asset(AppAssets.arrowIcon),
          ),
          onTap: () {
            setState(() {
              _isExpanded = !_isExpanded;
            });
            if (_isExpanded) {
              _iconAnimationController.forward();
            } else {
              _iconAnimationController.reverse();
            }
          },
        ),
        AnimatedSize(
          duration: AppDurations.customizationItemAnimation,
          child: _isExpanded
              ? Column(
                  children: widget.itemList
                      .where((ruleType) => ruleType != _selectedRule)
                      .map(
                        (ruleType) => _RulesItem(
                          ruleType: ruleType.toString(),
                          onTap: () {
                            setState(() {
                              _isExpanded = false;
                              _selectedRule = ruleType;
                            });
                            widget.onChanged?.call(ruleType);
                            if (_isExpanded) {
                              _iconAnimationController.forward();
                            } else {
                              _iconAnimationController.reverse();
                            }
                          },
                        ),
                      )
                      .toList(),
                )
              : const SizedBox.shrink(),
        ),
      ],
    );
  }
}

class _RulesItem extends StatelessWidget {
  const _RulesItem({
    required this.ruleType,
    required this.onTap,
    this.trailing,
  });

  final String ruleType;
  final VoidCallback onTap;
  final Widget? trailing;

  // String _naming(T ruleType) {
  //   switch (ruleType.runtimeType) {
  //     case int:
  //       return ruleType.toString();
  //     case RuleType:
  //       return (ruleType as RuleType).name;
  //     default:
  //       return '';
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: AppDimensions.margin2XS,
            horizontal: AppDimensions.marginM,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                ruleType,
                // _naming(ruleType),
                style: context.theme.textTheme.bodyLarge,
              ),
              if (trailing != null) trailing!,
            ],
          ),
        ),
      ),
    );
  }
}
