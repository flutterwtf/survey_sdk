import 'package:flutter/material.dart';
import 'package:survey_sdk/survey_sdk.dart';

class SwitchCustomizationItem extends StatelessWidget {
  final String title;
  final bool? initialValue;
  final ValueChanged<bool>? onChanged;

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
  final ValueChanged<bool>? onChanged;

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
        height: SurveyDimensions.switchHeight,
        width: SurveyDimensions.switchWidth,
        decoration: BoxDecoration(
          color: _isToggled
              ? SurveyColors.switchBackgroundActive
              : SurveyColors.switchBackgroundInactive,
          borderRadius: const BorderRadius.all(
            Radius.circular(SurveyDimensions.circularRadiusS),
          ),
        ),
        duration: SurveyDurations.customizationItemDuration,
        child: AnimatedAlign(
          alignment: _isToggled ? Alignment.centerRight : Alignment.centerLeft,
          duration: SurveyDurations.customizationItemDuration,
          child: Container(
            margin: const EdgeInsets.all(SurveyDimensions.margin3XS),
            width: SurveyDimensions.switchIndicatorWidth,
            decoration: const BoxDecoration(
              color: SurveyColors.black,
              borderRadius: BorderRadius.all(
                Radius.circular(SurveyDimensions.circularRadiusM),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
