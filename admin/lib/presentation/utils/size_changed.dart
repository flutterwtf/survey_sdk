void onSizeChanged(String? value, void Function(int size) function) {
  if (value == null) return;

  final size = int.tryParse(value);
  if (size != null) {
    function(size);
  }
}
