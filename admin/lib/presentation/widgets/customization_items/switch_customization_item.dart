import 'package:flutter/material.dart';
import 'package:survey_admin/presentation/utils/app_colors.dart';
import 'package:survey_admin/presentation/utils/constants/app_dimensions.dart';
import 'package:survey_admin/presentation/utils/constants/app_durations.dart';
import 'package:survey_admin/presentation/utils/theme_extension.dart';

class SwitchCustomizationItem extends StatelessWidget {
  final String title;
  final bool? initialValue;
  final void Function(bool isToggled)? onChanged;

  const SwitchCustomizationItem({
    required this.title,
    this.initialValue,
    this.onChanged,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: context.theme.textTheme.titleSmall,
        ),
        _CustomSwitch(
          initialValue: initialValue ?? false,
          onChanged: onChanged,
        ),
      ],
    );
  }
}

class _CustomSwitch extends StatefulWidget {
  final bool initialValue;
  final void Function(bool isToggled)? onChanged;

  const _CustomSwitch({
    required this.initialValue,
    this.onChanged,
  });

  @override
  State<_CustomSwitch> createState() => _CustomSwitchState();
}

class _CustomSwitchState extends State<_CustomSwitch> {
  bool _isToggled = false;

  @override
  void initState() {
    super.initState();

    _isToggled = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() => _isToggled = !_isToggled);
        widget.onChanged?.call(_isToggled);
      },
      child: AnimatedContainer(
        height: AppDimensions.switchHeight,
        width: AppDimensions.switchWidth,
        decoration: BoxDecoration(
          color: _isToggled
              ? AppColors.switchBackgroundActive
              : AppColors.switchBackgroundInactive,
          borderRadius: const BorderRadius.all(
            Radius.circular(AppDimensions.circularRadiusS),
          ),
        ),
        duration: AppDurations.customizationItem,
        child: AnimatedAlign(
          alignment: _isToggled ? Alignment.centerRight : Alignment.centerLeft,
          duration: AppDurations.customizationItem,
          child: Padding(
            padding: const EdgeInsets.all(AppDimensions.margin3XS),
            child: Container(
              width: AppDimensions.switchIndicatorWidth,
              decoration: const BoxDecoration(
                color: AppColors.black,
                borderRadius: BorderRadius.all(
                  Radius.circular(AppDimensions.circularRadiusXS),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
