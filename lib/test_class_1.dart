class TestClass1 {
  int _privateInt = 10;
}

abstract interface class Test1 {
  int get price;

  void test();
}

mixin TestSealed {}

final class Test1212 with TestSealed {}

final class Test1213 implements Test1212 {
  Test1213({this.onTap});

  final void Function()? onTap;

  void testOnTap() {
    onTap?.call();
  }
}
