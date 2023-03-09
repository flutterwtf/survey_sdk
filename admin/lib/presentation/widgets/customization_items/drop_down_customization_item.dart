import 'package:flutter/material.dart';
import 'package:survey_admin/presentation/utils/constants/constants.dart';

class DropdownCustomizationItem<T> extends StatelessWidget {
  final Widget child;
  final T value;
  final void Function(T value) onChange;

  const DropdownCustomizationItem({
    required this.child,
    required this.value,
    required this.onChange,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onChange(value),
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
