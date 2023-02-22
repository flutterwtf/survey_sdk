import 'package:flutter/material.dart';
import 'package:survey_admin/presentation/app/localization/localizations.dart';
import 'package:survey_admin/presentation/utils/app_fonts.dart';
import 'package:survey_admin/presentation/utils/constants/constants.dart';

enum InputType {
  text('Text'),
  number('Number'),
  date('Date');

  const InputType(
    this.name,
  );

  final String name;
}

class InputTypeCustomizationItem extends StatefulWidget {
  const InputTypeCustomizationItem({
    super.key,
    this.initialValue = InputType.text,
    this.onChanged,
  });

  final InputType initialValue;
  final void Function(InputType inputType)? onChanged;

  @override
  State<InputTypeCustomizationItem> createState() => _InputTypeCustomizationItemState();
}

class _InputTypeCustomizationItemState extends State<InputTypeCustomizationItem>
    with SingleTickerProviderStateMixin {
  late bool _isExpanded;
  late InputType _selectedType;
  late AnimationController _iconAnimationController;

  @override
  void initState() {
    super.initState();
    _isExpanded = false;
    _selectedType = widget.initialValue;
    _iconAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 100),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _InputTypeItem(
          inputType: _selectedType,
          trailing: AnimatedBuilder(
            animation: _iconAnimationController,
            builder: (_, __) => CustomPaint(
              painter: _DropdownListIconPainter(
                animatedValue: _iconAnimationController.value,
              ),
              size: const Size.square(AppDimensions.sizeS),
            ),
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
          duration: const Duration(milliseconds: 100),
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

class _InputTypeItem extends StatelessWidget {
  const _InputTypeItem({
    required this.inputType,
    required this.onTap,
    this.trailing,
  });

  final InputType inputType;
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
                inputType.name,
                style: const TextStyle(
                  fontSize: AppFonts.sizeL,
                  fontWeight: AppFonts.weightRegular,
                ),
              ),
              if (trailing != null) trailing!,
            ],
          ),
        ),
      ),
    );
  }
}

//TODO: let's replace it just with the common arrow icon
class _DropdownListIconPainter extends CustomPainter {
  const _DropdownListIconPainter({
    required this.animatedValue,
  });

  final double animatedValue;

  @override
  void paint(Canvas canvas, Size size) {
    final leftStartPoint = Offset(0, size.height / 2);
    final rightStartPoint = Offset(size.width, size.height / 2);
    final center = Offset(size.width / 2, size.height * (1 - animatedValue));
    final paint = Paint();

    canvas.drawLine(leftStartPoint, center, paint);
    canvas.drawLine(rightStartPoint, center, paint);
  }

  @override
  bool shouldRepaint(covariant _DropdownListIconPainter oldDelegate) {
    return animatedValue != oldDelegate.animatedValue;
  }
}
