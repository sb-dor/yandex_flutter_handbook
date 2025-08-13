import 'package:flutter/material.dart';

class TestInhWidget2 extends InheritedWidget {
  const TestInhWidget2({super.key, required super.child, required this.listOfIntegers});

  static TestInhWidget2 of(BuildContext context) {
    final TestInhWidget2? result = context.dependOnInheritedWidgetOfExactType<TestInhWidget2>();
    assert(result != null, 'No TestInhWidget2 found in context');
    return result!;
  }

  final List<int> listOfIntegers;

  @override
  bool updateShouldNotify(TestInhWidget2 old) {
    return true;
  }
}

class TestInhWidget2Config extends StatefulWidget {
  const TestInhWidget2Config({super.key});

  @override
  State<TestInhWidget2Config> createState() => _TestInhWidget2ConfigState();
}

class _TestInhWidget2ConfigState extends State<TestInhWidget2Config> {
  List<int> integers = [];

  void addInt() {
    setState(() {
      integers.add(1);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.expand(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(onPressed: addInt, child: Icon(Icons.add)),
            TestInhWidget2(listOfIntegers: integers, child:  _TestInhWidget2Text()),
          ],
        ),
      ),
    );
  }
}

class _TestInhWidget2Text extends StatefulWidget {
  const _TestInhWidget2Text({super.key});

  @override
  State<_TestInhWidget2Text> createState() => _TestInhWidget2TextState();
}

class _TestInhWidget2TextState extends State<_TestInhWidget2Text> {
  @override
  void didChangeDependencies() {
    print("did change deps");
    super.didChangeDependencies();
  }

  @override
  void didUpdateWidget(covariant _TestInhWidget2Text oldWidget) {
    print("did update widget");
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return Text(TestInhWidget2.of(context).listOfIntegers.toString());
  }
}
