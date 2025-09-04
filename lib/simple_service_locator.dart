// without using get_it package (which is not recommended)
// will you use a package just for registering in service locator like this
class ServiceLocator {
  ServiceLocator._();

  static ServiceLocator get _instance => ServiceLocator._();

  factory ServiceLocator() => _instance;

  final Map<Type, dynamic> _services = {};

  void register<T>(T instance) {
    _services[T] = instance;
  }

  T get<T>() {
    return _services[T] as T;
  }
}
