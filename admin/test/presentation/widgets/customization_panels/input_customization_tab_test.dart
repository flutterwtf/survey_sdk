import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:survey_admin/presentation/widgets/customization_items/color_customization_item.dart';
import 'package:survey_admin/presentation/widgets/customization_items/customization_items_container.dart';
import 'package:survey_admin/presentation/widgets/customization_items/customization_widgets/customization_text_field.dart';
import 'package:survey_admin/presentation/widgets/customization_items/dropdown_customization_button.dart';
import 'package:survey_admin/presentation/widgets/customization_items/multiline_switch.dart';
import 'package:survey_admin/presentation/widgets/customization_items/padding_customization_item.dart';
import 'package:survey_admin/presentation/widgets/customization_panel/input/input_customization_tab.dart';
import 'package:survey_core/survey_core.dart';

import '../app_tester.dart';

void main() {
  group(
    'Input customization tab tests',
    () {
      final page = AppTester(
        child: InputCustomizationTab(
          onBorderColorChanged: (Color value) {},
          onBorderSizeChanged: (double? value) {},
          onBorderWidthChanged: (double? value) {},
          onFillColorChanged: (Color value) {},
          onHintColorChanged: (Color value) {},
          onHintFontSizeChanged: (double? value) {},
          onHorizontalPaddingUpdate: (double size) {},
          onInputTypeChanged: (InputType value) {},
          onMultilineChanged: ({
            required bool isMultiline,
            required int lineAmount,
          }) {},
          onTextColorChanged: (Color value) {},
          onTextFontSizeChanged: (double? value) {},
          onVerticalPaddingUpdate: (double size) {},
          onValidatorErrorChanged: (String errorText) {},
          title: 'test',
          inputType: InputType.text,
        ),
      );

      testWidgets(
        'widget initialized correctly',
        (widgetTester) async {
          await widgetTester.pumpWidget(page);
          await widgetTester.pumpAndSettle();
          expect(find.text('test'), findsNothing);

          expect(
            find.widgetWithText(CustomizationItemsContainer, 'Multiline'),
            findsOneWidget,
          );
          expect(
            find.widgetWithText(CustomizationItemsContainer, 'Fill'),
            findsOneWidget,
          );
          expect(
            find.widgetWithText(CustomizationItemsContainer, 'Border'),
            findsOneWidget,
          );
          expect(
            find.widgetWithText(CustomizationItemsContainer, 'Padding'),
            findsOneWidget,
          );
          expect(
            find.widgetWithText(CustomizationItemsContainer, 'Hint'),
            findsOneWidget,
          );
          // TODO(dev): change this to findsNWidget(2) when the values from
          // TODO(dev): localization are returned to the input type.
          expect(
            find.widgetWithText(CustomizationItemsContainer, 'Text'),
            findsOneWidget,
          );
          expect(
            find.widgetWithText(CustomizationItemsContainer, 'Input type'),
            findsOneWidget,
          );
        },
      );

      testWidgets(
        'initial values',
        (widgetTester) async {
          await widgetTester.pumpWidget(page);
          await widgetTester.pumpAndSettle();

          // Multiline widget switch is off
          expect(
            find.widgetWithText(CustomizationItemsContainer, 'Lines'),
            findsNothing,
          );
          expect(
            find.widgetWithText(CustomizationItemsContainer, 'FFFFFFFF'),
            findsOneWidget,
          );
          expect(
            find.widgetWithText(CustomizationItemsContainer, 'FF000000'),
            findsNWidgets(2),
          );
          expect(
            find.widgetWithText(CustomizationItemsContainer, 'FF929292'),
            findsOneWidget,
          );
          expect(
            find.byWidgetPredicate(
              (widget) =>
                  widget is PaddingCustomizationItem &&
                  widget.initialHorizontalPadding == 14.0 &&
                  widget.initialVerticalPadding == 14.0,
            ),
            findsOneWidget,
          );
          // TODO(dev): change this to Text from text when the values from
          // TODO(dev): localization are returned to the input type.
          expect(
            find.widgetWithText(DropdownCustomizationButton<InputType>, 'text'),
            findsOneWidget,
          );
        },
      );

      testWidgets(
        'panel contains all the widgets',
        (widgetTester) async {
          await widgetTester.pumpWidget(page);
          await widgetTester.pumpAndSettle();

          expect(find.byType(CustomizationItemsContainer), findsNWidgets(7));
          expect(find.byType(MultilineSwitch), findsOneWidget);
          expect(
            find.byType(DropdownCustomizationButton<InputType>),
            findsOneWidget,
          );
          expect(find.byType(ColorCustomizationItem), findsNWidgets(4));
          expect(find.byType(PaddingCustomizationItem), findsNWidgets(1));
          expect(find.byType(CustomizationTextField), findsNWidgets(6));
        },
      );
    },
  );
}
