extension ListExtension<T> on List<T> {
  T? firstWhereOrNull(bool Function(T element) predicate) {
    for (final element in this) {
      if (predicate(element)) {
        return element;
      }
    }
    return null;
  }
}
