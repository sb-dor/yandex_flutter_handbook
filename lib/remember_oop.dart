void main() {
  final test = Test<TestClass>(Second());
    switch(test.test){
      case First(): print("firstg");
        break;
      case Second(): print("second");
        break;
    }
}

sealed class TestClass {
  void testMethod();
}

final class First extends TestClass {
  @override
  void testMethod() {
    print("first");
  }
}

final class Second extends TestClass {
  @override
  void testMethod() {
    print("second");
  }
}

class Test<G> {
  Test(this.test);

  final G test;
}

mixin class Test1FunctionOverall {
  void test1() {}
}

abstract interface class TestInterface {
  void test1();

  void test2() {}
}

class TestInterfaceImpl with Test1FunctionOverall implements TestInterface {
  @override
  void test2() {}
}

class MyAbstractMixin {
  void bar() {}
}

class JustClassTestClass implements MyAbstractMixin {
  void testMethod() {
    print("JustClassTestClass");
  }

  @override
  void bar() {
    print("JustClassTestClass");
  }
}
