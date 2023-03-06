import 'dart:convert';

import 'package:collection/collection.dart';

String sortARB(
  String arbContents, {
  int Function(String, String)? compareFunction,
  bool caseInsensitive = false,
  bool naturalOrdering = false,
  bool descendingOrdering = false,
}) {
  compareFunction ??= (a, b) =>
      _commonSorts(a, b, caseInsensitive, naturalOrdering, descendingOrdering);

  final sorted = <String, dynamic>{};
  final Map<String, dynamic> contents = json.decode(arbContents);

  final keys = contents.keys.toList()..sort(compareFunction);

  for (final key in keys) {
    sorted[key] = contents[key];
  }

  const encoder = JsonEncoder.withIndent('  ');
  return encoder.convert(sorted);
}

int _commonSorts(String a, String b, bool isCaseInsensitive,
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
