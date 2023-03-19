void onSizeChanged(String? value, void Function(int size) action) {
  final size = int.tryParse(value ?? '');
  if (size != null) {
    action(size);
  }
}
