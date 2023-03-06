import 'dart:io';
//import 'localization_sort.dart';
import 'localization_test.dart';

const filePath = 'lib/src/presentation/localization/l10n/app_en.arb';

void main() async {
  if (filePath.isEmpty) {
    throw (('Expected filepath to arb file.'));
  }

  final file = File(filePath);

  final arbContents = await file.readAsString();

  // final arbContentsSorted = sortARB(
  //   arbContents,
  //   caseInsensitive: true,
  //   naturalOrdering: false,
  //   descendingOrdering: false,
  // );
  // await file.writeAsString(arbContentsSorted);

  final arbIsSorted = isSorted(arbContents);
  if (!arbIsSorted) throw (('Test Failed. Arb File is not sorted.'));

  final notInCamelCaseList = notInCamelCase(arbContents);
  if (notInCamelCaseList.isNotEmpty) {
    throw (('Test Failed. Arb File contains not camelCase keys:\n $notInCamelCaseList'));
  }
}
