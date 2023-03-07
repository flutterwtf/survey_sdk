import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:survey_admin/presentation/widgets/customization_items/customization_widgets/customization_text_field.dart';

import '../app_test.dart';

void main() {
  testWidgets('initialValue property', (tester) async {
    await tester.pumpWidget(
      const AppTest(
        child: CustomizationTextField(
          initialValue: 'initialValue',
        ),
      ),
    );

    expect(find.text('initialValue'), findsOneWidget);
  });

  testWidgets('onChanged property', (tester) async {
    String? text;
    await tester.pumpWidget(
      AppTest(
        child: CustomizationTextField(
          onChanged: (newText) {
            text = newText;
          },
        ),
      ),
    );

    await tester.enterText(find.byType(TextFormField), 'test');
    expect(text, 'test');

    await tester.enterText(find.byType(TextFormField), '');
    expect(text, '');
  });

  testWidgets('fontSize property', (tester) async {
    await tester.pumpWidget(
      const AppTest(
        child: CustomizationTextField(
          fontSize: 14,
        ),
      ),
    );

    final textField = tester.widget<TextField>(
      find.byType(TextField),
    );
    expect(textField.style!.fontSize, 14);
  });

  testWidgets('inputFormatters property', (tester) async {
    await tester.pumpWidget(
      AppTest(
        child: CustomizationTextField(
          inputFormatters: [
            FilteringTextInputFormatter.digitsOnly,
            LengthLimitingTextInputFormatter(3),
          ],
        ),
      ),
    );

    await tester.enterText(find.byType(TextFormField), 'fd13sd234');
    expect(find.text('132'), findsOneWidget);
  });

  testWidgets('focusNode property', (tester) async {
    final focusNode = FocusNode();
    await tester.pumpWidget(
      AppTest(
        child: Scaffold(
          body: CustomizationTextField(
            focusNode: focusNode,
          ),
        ),
      ),
    );

    final textField = tester.widget<CustomizationTextField>(
      find.byType(CustomizationTextField),
    );
    expect(textField.focusNode, focusNode);
  });

  testWidgets('onEditingComplete property', (tester) async {
    var amountOfChanges = 0;
    await tester.pumpWidget(
      AppTest(
        child: CustomizationTextField(
          onEditingComplete: () {
            amountOfChanges++;
          },
        ),
      ),
    );

    expect(amountOfChanges, 0);

    await tester.enterText(find.byType(TextFormField), 'text1');
    expect(amountOfChanges, 0);

    await tester.testTextInput.receiveAction(TextInputAction.done);
    expect(amountOfChanges, 1);

    await tester.enterText(find.byType(TextFormField), 'text2');
    await tester.testTextInput.receiveAction(TextInputAction.done);
    expect(amountOfChanges, 2);
  });

  testWidgets('controller property', (tester) async {
    final controller = TextEditingController();
    await tester.pumpWidget(
      AppTest(
        child: CustomizationTextField(
          controller: controller,
        ),
      ),
    );

    controller.text = 'test';
    expect(find.text('test'), findsOneWidget);

    await tester.enterText(find.byType(TextFormField), 'text');
    expect(controller.text, 'text');
  });

  testWidgets('decoration property', (tester) async {
    const decoration = InputDecoration(
      isCollapsed: true,
      isDense: true,
      fillColor: Colors.black,
    );
    await tester.pumpWidget(
      const AppTest(
        child: CustomizationTextField(
          decoration: decoration,
        ),
      ),
    );

    final textField = tester.widget<CustomizationTextField>(
      find.byType(CustomizationTextField),
    );
    expect(textField.decoration, decoration);
  });
}
