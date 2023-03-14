import 'dart:convert';
import 'dart:io';

import 'package:collection/collection.dart';

const filePath = 'lib/presentation/app/localization/l10n/app_en.arb';

void main() async {
  if (filePath.isEmpty) {
    throw const FileSystemException('Expected filepath to arb file.', filePath);
  }

  final file = File(filePath);

  final arbContents = await file.readAsString();

  final arbIsSorted = _isSorted(arbContents);
  if (!arbIsSorted) {
    return;
  }

  final notInCamelCaseList = _notInCamelCase(arbContents);
  if (notInCamelCaseList.isNotEmpty) {
    return;
  }
}

List<String> _notInCamelCase(String arbContents) {
  final camelCaseExp = RegExp(r'[a-z]+((\d)|([A-Z0-9][a-z0-9]+))*([A-Z])?');
  final Map<String, dynamic> contents = json.decode(arbContents);
  final notInCamelCase = contents.keys
      .toList()
      .where(
        (element) => !element.contains(camelCaseExp) || element.contains('_'),
      )
      .toList();
  return notInCamelCase;
}

bool _isSorted(
  String arbContents, {
  bool caseInsensitive = false,
  bool naturalOrdering = false,
  bool descendingOrdering = false,
}) {
  int compareFunction(a, b) => _commonCompareFunction(
        a,
        b,
        caseInsensitive,
        naturalOrdering,
        descendingOrdering,
      );

  final Map<String, dynamic> contents = json.decode(arbContents);

  final isSorted = contents.keys.toList().isSorted(compareFunction);

  return isSorted;
}

int _commonCompareFunction(
  String a,
  String b,
  bool isCaseInsensitive,
  bool isNaturalOrdering,
  bool isDescending,
) {
  var firstStr = a;
  var secondStr = b;

  var ascending = 1;
  if (isDescending) {
    ascending = -1;
  }

  if (isCaseInsensitive) {
    firstStr = firstStr.toLowerCase();
    secondStr = secondStr.toLowerCase();
  }

  if (isNaturalOrdering) {
    return ascending * compareNatural(firstStr, secondStr);
  } else {
    return ascending * firstStr.compareTo(secondStr);
  }
}
