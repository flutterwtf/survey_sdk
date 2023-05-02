// TODO(dev): rethink this.
abstract class SizeHandler {
  static void onSizeChanged(String? value, void Function(double size) action) {
    final size = double.tryParse(value ?? '');
    if (size != null) {
      action(size);
    }
  }

  static void onNumberChanged(String? value, void Function(int size) action) {
    final size = int.tryParse(value ?? '');
    if (size != null) {
      action(size);
    }
  }
}
