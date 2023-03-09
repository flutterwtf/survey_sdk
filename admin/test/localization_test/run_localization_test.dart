import 'dart:io';
import 'localization_test.dart';

const filePath = 'lib/presentation/app/localization/l10n/app_en.arb';

void main() async {
  if (filePath.isEmpty) {
    throw (('Expected filepath to arb file.'));
  }

  final file = File(filePath);

  final arbContents = await file.readAsString();

  final arbIsSorted = isSorted(arbContents);
  if (!arbIsSorted) throw (('Test Failed. Arb File is not sorted.'));

  final notInCamelCaseList = notInCamelCase(arbContents);
  if (notInCamelCaseList.isNotEmpty) {
    throw (('Test Failed. Arb File contains not camelCase keys:\n $notInCamelCaseList'));
  }
}
