abstract class Cache<T> {
  /// retreive value from cache
  T getValue();

  /// set value to cache
  Future<void> setValue(T value);

  /// delete value from cache
  Future<void> delValue();
}
