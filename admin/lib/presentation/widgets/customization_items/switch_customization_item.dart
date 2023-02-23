import 'package:flutter/material.dart';
import 'package:survey_admin/presentation/utils/colors.dart';
import 'package:survey_admin/presentation/utils/constants/app_duration.dart';
import 'package:survey_admin/presentation/widgets/customization_items/customization_widgets/customization_text.dart';

//TODO: extend every item from CustomizationItem class
class SwitchCustomizationItem extends StatelessWidget {
  const SwitchCustomizationItem({
    super.key,
    required this.title,
    this.initialValue,
    this.onChanged,
  });

  final String title;
  final bool? initialValue;
  final void Function(bool isToggled)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomizationText(title),
        const Spacer(),
        _CustomSwitch(
          initialValue: initialValue,
          onChanged: onChanged,
        ),
      ],
    );
  }
}

class _CustomSwitch extends StatefulWidget {
  const _CustomSwitch({
    this.initialValue,
    this.onChanged,
  });

  final bool? initialValue;
  final void Function(bool isToggled)? onChanged;

  @override
  State<_CustomSwitch> createState() => _CustomSwitchState();
}

class _CustomSwitchState extends State<_CustomSwitch> {
  bool _isToggled = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      key: const Key('Switch'),
      onTap: () {
        setState(() {
          _isToggled = !_isToggled;
        });
        widget.onChanged?.call(_isToggled);
      },
      child: AnimatedContainer(
        height: 18,
        width: 34,
        decoration: BoxDecoration(
          color: _isToggled ? AppColors.switchBackgroundActive : AppColors.switchBackgroundInactive,
          borderRadius: BorderRadius.circular(9),
        ),
        duration: AppDuration.customizationItemAnimation,
        child: AnimatedAlign(
          alignment: _isToggled ? Alignment.centerRight : Alignment.centerLeft,
          duration: AppDuration.customizationItemAnimation,
          child: Padding(
            padding: const EdgeInsets.all(2),
            child: Container(
              width: 14,
              decoration: BoxDecoration(
                color: AppColors.black,
                borderRadius: BorderRadius.circular(7),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
