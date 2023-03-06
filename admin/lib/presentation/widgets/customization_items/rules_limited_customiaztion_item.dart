import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:survey_admin/presentation/utils/constants/app_assets.dart';
import 'package:survey_admin/presentation/utils/constants/app_durations.dart';
import 'package:survey_admin/presentation/utils/constants/constants.dart';
import 'package:survey_admin/presentation/utils/theme_extension.dart';

class RulesLimitedCustomizationItem extends StatefulWidget {
  const RulesLimitedCustomizationItem({
    super.key,
    this.onChanged,
    this.rulesLimitedList = 0,
    this.initialValue = 0,
  });

  final int rulesLimitedList;
  final int initialValue;
  final void Function(int ruleLimited)? onChanged;

  @override
  State<RulesLimitedCustomizationItem> createState() =>
      _RulesLimitedCustomizationItemState();
}

class _RulesLimitedCustomizationItemState
    extends State<RulesLimitedCustomizationItem>
    with SingleTickerProviderStateMixin {
  late bool _isExpanded;
  late int _selectedRuleLimited;
  late List<int> _rulesLimitedList;
  late final AnimationController _iconAnimationController;
  late final Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _isExpanded = false;
    _rulesLimitedList = _initrulesLimitedList(widget.rulesLimitedList);
    _selectedRuleLimited = widget.initialValue;
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

  List<int> _initrulesLimitedList(int count) {
    final rulesLimitedList = <int>[];
    // ignore: omit_local_variable_types
    for (int i = 0; i <= count; i++) {
      rulesLimitedList.add(i);
    }
    return rulesLimitedList;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _RulesLimitedItem(
          ruleLimited: _selectedRuleLimited,
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
                  children: _rulesLimitedList
                      .where(
                          (ruleLimited) => ruleLimited != _selectedRuleLimited)
                      .map(
                        (ruleLimited) => _RulesLimitedItem(
                          ruleLimited: ruleLimited,
                          onTap: () {
                            setState(() {
                              _isExpanded = false;
                              _selectedRuleLimited = ruleLimited;
                            });
                            widget.onChanged?.call(ruleLimited);
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

class _RulesLimitedItem extends StatelessWidget {
  const _RulesLimitedItem({
    required this.ruleLimited,
    required this.onTap,
    this.trailing,
  });

  final int ruleLimited;
  final VoidCallback onTap;
  final Widget? trailing;

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
                ruleLimited.toString(),
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
