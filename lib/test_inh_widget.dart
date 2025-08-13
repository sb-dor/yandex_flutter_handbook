import 'package:flutter/material.dart';

/// update should notify works if you use [dependOnInheritedWidgetOfExactType] + [updateShouldNotify] returns true
/// even if you use [dependOnInheritedWidgetOfExactType] but [updateShouldNotify] returns false = [didChangeDependencies] will not work
/// even if [updateShouldNotify] returns true but you don't use [dependOnInheritedWidgetOfExactType] = [didChangeDependencies] will not work

/// if you want [didChangeDependencies] to work then - you have to use [dependOnInheritedWidgetOfExactType] + [updateShouldNotify] should return true

/// [didUpdateWidget] is about the rebuilding same widget by parent
/// for ex: parent called setState and one of it's children rebuilt, so if you use [didUpdateWidget] in child it will show
/// whether same widget's element changed with new one (so rebuilt)

class TestInhWidget extends InheritedWidget {
  const TestInhWidget({super.key, required this.state, required super.child});

  static TestInhWidget of(BuildContext context, {bool listen = false}) {
    if (listen) {
      final testInhWidget = context.dependOnInheritedWidgetOfExactType<TestInhWidget>();
      assert(testInhWidget != null, 'No TestInhWidget found in context');
      return testInhWidget!;
    } else {
      final findTestUInhWidget = context
          .getElementForInheritedWidgetOfExactType<TestInhWidget>()
          ?.widget;
      final checkInhWidget = findTestUInhWidget is TestInhWidget;
      assert(checkInhWidget, "TestInhWidget not found in context");
      return (findTestUInhWidget as TestInhWidget);
    }
  }

  final TestInhWidgetImplState state;

  @override
  bool updateShouldNotify(TestInhWidget old) {
    return true;
  }
}

class TestInhWidgetImpl extends StatefulWidget {
  const TestInhWidgetImpl({super.key});

  @override
  State<TestInhWidgetImpl> createState() => TestInhWidgetImplState();
}

class TestInhWidgetImplState extends State<TestInhWidgetImpl> {
  int number = 1;

  void increment() {
    setState(() {
      number++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TestInhWidget(state: this, child: _MainScreen());
  }
}

class _MainScreen extends StatefulWidget {
  const _MainScreen();

  @override
  State<_MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<_MainScreen> {
  @override
  Widget build(BuildContext context) {
    MediaQuery.of(context);
    return Scaffold(
      appBar: AppBar(title: Text("Embrace the ugly the miserable")),
      body: const _IsolatedWidget(),
    );
  }
}

class _IsolatedWidget extends StatefulWidget {
  const _IsolatedWidget();

  @override
  State<_IsolatedWidget> createState() => _IsolatedWidgetState();
}

class _IsolatedWidgetState extends State<_IsolatedWidget> {
  @override
  void didChangeDependencies() {
    print("was called method: didChangeDependencies");
    super.didChangeDependencies();
  }

  @override
  void didUpdateWidget(covariant _IsolatedWidget oldWidget) {
    print("was called method: didUpdateWidget");
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Column(
        children: [
          TextButton(
            onPressed: () {
              TestInhWidget.of(context).state.increment();
            },
            child: Icon(Icons.plus_one),
          ),
          Text("${TestInhWidget.of(context, listen: true).state.number}"),
        ],
      ),
    );
  }
}
