import 'package:flutter/material.dart';
import 'package:survey_admin/presentation/utils/app_fonts.dart';
import 'package:survey_admin/presentation/utils/colors.dart';
import 'package:survey_admin/presentation/widgets/customization_items/item_divider.dart';

class Panel {
  final String label;
  final List<Widget> content;

  Panel({required this.label, required this.content});
}

class CustomizationPanelConstructor extends StatefulWidget {
  final List<Panel> panels;

  const CustomizationPanelConstructor({Key? key, required this.panels})
      : super(key: key);

  @override
  State<CustomizationPanelConstructor> createState() =>
      _CustomizationPanelConstructorState();
}

class _CustomizationPanelConstructorState
    extends State<CustomizationPanelConstructor> {
  Panel? _currentPanel;

  @override
  void initState() {
    super.initState();
    if (widget.panels.isNotEmpty) {
      _currentPanel = widget.panels.first;
    }
  }

  @override
  Widget build(BuildContext context) {
    final currentPanel = _currentPanel;
    return Column(
      children: [
        if (currentPanel != null) ...[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: widget.panels
                .map(
                  (panel) => _Label(
                    text: panel.label,
                    textColor: panel.label == currentPanel.label
                        ? AppColors.black
                        : AppColors.textLightGrey,
                    onPressed: () => setState(() => _currentPanel = panel),
                  ),
                )
                .toList(),
          ),
          const ItemDivider(),
          Column(
            children: currentPanel.content,
          ),
        ]
      ],
    );
  }
}

class _Label extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color textColor;

  const _Label({
    Key? key,
    required this.text,
    required this.onPressed,
    required this.textColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        text,
        style: TextStyle(color: textColor, fontSize: AppFonts.sizeM),
      ),
    );
  }
}
