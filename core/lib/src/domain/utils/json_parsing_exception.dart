class JsonParsingException implements Exception {
  final String message;
  final String json;

  JsonParsingException(this.message, this.json);

  @override
  String toString() {
    return 'JsonParsingException: $message';
  }

  String damagedJson() {
    return 'Damaged JSON:\n$json';
  }
}
