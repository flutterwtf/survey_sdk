import 'package:flutter/material.dart';
import 'package:survey_admin/presentation/app/localization/localizations.dart';
import 'package:survey_admin/presentation/utils/constants/app_dimensions.dart';
import 'package:survey_admin/presentation/utils/constants/app_durations.dart';
import 'package:survey_admin/presentation/widgets/customization_items/customization_widgets/customization_text_field.dart';
import 'package:survey_admin/presentation/widgets/customization_items/switch_customization_item.dart';

class SecondaryButtonCustomizationItem extends StatefulWidget {
  final void Function(bool isShown, String text) onChanged;
  final String initialText;
  final bool isShown;

  const SecondaryButtonCustomizationItem({
    required this.onChanged,
    this.initialText = '',
    this.isShown = false,
    super.key,
  });

  @override
  State<SecondaryButtonCustomizationItem> createState() =>
      _SecondaryButtonCustomizationItemState();
}

class _SecondaryButtonCustomizationItemState
    extends State<SecondaryButtonCustomizationItem> {
  late bool _isShown;
  late String _text;

  @override
  void initState() {
    super.initState();

    _isShown = widget.isShown;
    _text = widget.initialText;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SwitchCustomizationItem(
          title: context.localization.secondary_button,
          onChanged: (isToggled) {
            setState(() => _isShown = isToggled);
            widget.onChanged(_isShown, _text);
          },
        ),
        AnimatedSize(
          duration: AppDurations.customizationItemAnimation,
          child: _isShown
              ? Padding(
                  padding: const EdgeInsets.only(
                    top: AppDimensions.marginM,
                  ),
                  child: CustomizationTextField(
                    initialValue: widget.initialText,
                    onChanged: (text) {
                      if (text != null) {
                        setState(() => _text = text);
                      }
                      widget.onChanged(_isShown, _text);
                    },
                    decoration: InputDecoration(
                      hintText: context.localization.enter_text,
                      isCollapsed: true,
                      border: InputBorder.none,
                    ),
                  ),
                )
              : const SizedBox.shrink(),
        ),
      ],
    );
  }
}
