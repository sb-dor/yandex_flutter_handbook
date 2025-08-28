import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(home: TestWidgetKeys6()));

class TestWidgetKeys6 extends StatefulWidget {
  const TestWidgetKeys6({super.key});

  @override
  State<TestWidgetKeys6> createState() => _TestWidgetKeys6State();
}

class _TestWidgetKeys6State extends State<TestWidgetKeys6> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          _TestWidgetKey(key: ValueKey("local")),
          TextButton(
            onPressed: () {
              setState(() {});
            },
            child: Text("Refresh"),
          ),
        ],
      ),
    );
  }
}

class _TestWidgetKey extends StatefulWidget {
  const _TestWidgetKey({super.key});

  @override
  State<_TestWidgetKey> createState() => _TestWidgetKeyState();
}

class _TestWidgetKeyState extends State<_TestWidgetKey> {
  // if there is same widget or same key with widget
  // this will be called
  @override
  void didUpdateWidget(covariant _TestWidgetKey oldWidget) {
    print("did update widget: $oldWidget");
    super.didUpdateWidget(oldWidget);
  }

  // if element creates or recreates this will be called
  @override
  void initState() {
    super.initState();
    print("initState: $widget");
  }

  // if element unmounts this will be called
  @override
  void dispose() {
    print("disposing: $widget");
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(width: 100, height: 100, color: Colors.red);
  }
}
