import 'dart:convert';

import 'package:collection/collection.dart';

List<String> notInCamelCase(String arbContents) {
  RegExp camelCaseExp = RegExp(r'[a-z]+((\d)|([A-Z0-9][a-z0-9]+))*([A-Z])?');
  final Map<String, dynamic> contents = json.decode(arbContents);
  final notInCamelCase = contents.keys
      .toList()
      .where((element) => !element.contains(camelCaseExp) || element.contains('_'))
      .toList();
  return notInCamelCase;
}

bool isSorted(
  String arbContents, {
  bool caseInsensitive = false,
  bool naturalOrdering = false,
  bool descendingOrdering = false,
}) {
  compareFunction(a, b) => _commonCompareFunction(
      a, b, caseInsensitive, naturalOrdering, descendingOrdering);

  final Map<String, dynamic> contents = json.decode(arbContents);

  final isSorted = contents.keys.toList().isSorted(compareFunction);

  return isSorted;
}

int _commonCompareFunction(String a, String b, bool isCaseInsensitive,
    bool isNaturalOrdering, bool isDescending) {
  var ascending = 1;
  if (isDescending) {
    ascending = -1;
  }
  if (isCaseInsensitive) {
    a = a.toLowerCase();
    b = b.toLowerCase();
  }

  if (isNaturalOrdering) {
    return ascending * compareNatural(a, b);
  } else {
    return ascending * a.compareTo(b);
  }
}
