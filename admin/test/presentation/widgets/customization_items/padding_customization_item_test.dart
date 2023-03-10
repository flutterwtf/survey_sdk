import 'package:flutter_test/flutter_test.dart';
import 'package:survey_admin/presentation/widgets/customization_items/padding_customization_item.dart';

import '../app_test.dart';

void main() {
  const initialHorizontalPadding = 12.0;
  const initialVerticalPadding = 16.0;
  double? horizontalPadding;
  double? verticalPadding;

  final page = AppTest(
    child: PaddingCustomizationItem(
      initialHorizontalPadding: initialHorizontalPadding,
      initialVerticalPadding: initialVerticalPadding,
      onHorizontalPaddingChange: (padding) {
        horizontalPadding = padding;
      },
      onVerticalPaddingChange: (padding) {
        verticalPadding = padding;
      },
    ),
  );

  testWidgets('Load widget with initial values', (tester) async {
    await tester.pumpWidget(page);

    expect(find.text('$initialHorizontalPadding'), findsWidgets);
    expect(find.text('$initialVerticalPadding'), findsWidgets);
  });

  testWidgets('Check input', (tester) async {
    const inputNumber = '18';

    await tester.pumpWidget(page);

    await tester.enterText(find.text('$initialHorizontalPadding'), inputNumber);
    await tester.enterText(find.text('$initialVerticalPadding'), inputNumber);
    expect(find.text(inputNumber), findsNWidgets(2));
  });

  testWidgets('Check validation', (tester) async {
    const tooLongNumber = '1234';
    const textWithNumber = '18px';

    await tester.pumpWidget(page);

    await tester.enterText(
      find.text('$initialHorizontalPadding'),
      tooLongNumber,
    );
    expect(find.text('123'), findsOneWidget);

    await tester.enterText(
      find.text('$initialVerticalPadding'),
      textWithNumber,
    );
    expect(find.text('18'), findsOneWidget);
  });

  testWidgets('Check onHorizontalPaddingChange', (tester) async {
    const inputPadding = 18;
    await tester.pumpWidget(page);

    await tester.enterText(
      find.text('$initialHorizontalPadding'),
      '$inputPadding',
    );
    await tester.testTextInput.receiveAction(TextInputAction.done);
    await tester.pump();

    expect(horizontalPadding, inputPadding);
  });

  testWidgets('Check onVerticalPaddingChange', (tester) async {
    const inputPadding = 18;
    await tester.pumpWidget(page);

    await tester.enterText(
      find.text('$initialVerticalPadding'),
      '$inputPadding',
    );
    await tester.testTextInput.receiveAction(TextInputAction.done);
    await tester.pump();

    expect(verticalPadding, inputPadding);
  });
}
