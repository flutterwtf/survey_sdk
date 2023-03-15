import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:survey_admin/presentation/app/localization/localizations.dart';
import 'package:survey_admin/presentation/utils/constants/app_assets.dart';
import 'package:survey_admin/presentation/utils/constants/app_durations.dart';
import 'package:survey_admin/presentation/utils/constants/app_dimensions.dart';
import 'package:survey_admin/presentation/utils/theme_extension.dart';
import 'package:survey_core/survey_core.dart';

extension InputTypeExt on InputType {
  String name(BuildContext context) {
    switch (this) {
      case InputType.text:
        return context.localization.text;
      case InputType.number:
        return context.localization.number;
      case InputType.date:
        return context.localization.date;
      case InputType.email:
        return context.localization.email;
      case InputType.password:
        return context.localization.password;
      case InputType.phone:
        return context.localization.phone;
    }
  }
}

class InputTypeCustomizationItem extends StatefulWidget {
  final InputType initialValue;
  final void Function(InputType inputType)? onChanged;

  const InputTypeCustomizationItem({
    super.key,
    this.initialValue = InputType.text,
    this.onChanged,
  });

  @override
  State<InputTypeCustomizationItem> createState() =>
      _InputTypeCustomizationItemState();
}

class _InputTypeCustomizationItemState extends State<InputTypeCustomizationItem>
    with SingleTickerProviderStateMixin {
  late bool _isExpanded;
  late InputType _selectedType;
  late final AnimationController _iconAnimationController;
  late final Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _isExpanded = false;
    _selectedType = widget.initialValue;
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
        _InputTypeItem(
          inputType: _selectedType,
          trailing: RotationTransition(
            turns: _animation,
            child: SvgPicture.asset(AppAssets.arrowIcon),
          ),
          onTap: () {
            !_isExpanded
                ? _iconAnimationController.forward()
                : _iconAnimationController.reverse();
            setState(() => _isExpanded = !_isExpanded);
          },
        ),
        AnimatedSize(
          duration: AppDurations.customizationItemAnimation,
          child: _isExpanded
              ? Column(
                  children: InputType.values
                      .where((inputType) => inputType != _selectedType)
                      .map(
                        (inputType) => _InputTypeItem(
                          inputType: inputType,
                          onTap: () {
                            setState(() {
                              _isExpanded = false;
                              _selectedType = inputType;
                            });
                            widget.onChanged?.call(inputType);
                            _isExpanded
                                ? _iconAnimationController.forward()
                                : _iconAnimationController.reverse();
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

class _InputTypeItem extends StatelessWidget {
  final InputType inputType;
  final VoidCallback onTap;
  final Widget? trailing;

  const _InputTypeItem({
    required this.inputType,
    required this.onTap,
    this.trailing,
  });

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
                inputType.name(context),
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
