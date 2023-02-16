import 'package:flutter/material.dart';
import 'package:survey_sdk/presentation/utils/app_fonts.dart';
import 'package:survey_sdk/presentation/utils/colors.dart';

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
        Text(
          title,
          style: const TextStyle(
            fontSize: AppFonts.sizeM,
            fontWeight: AppFonts.weightSemiBold,
          ),
        ),
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
        duration: const Duration(
          milliseconds: 100,
        ),
        child: AnimatedAlign(
          alignment: _isToggled ? Alignment.centerRight : Alignment.centerLeft,
          duration: const Duration(
            milliseconds: 100,
          ),
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
