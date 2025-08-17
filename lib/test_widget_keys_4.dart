import 'dart:math';

import 'package:flutter/material.dart';

class TestWidgetKeys4 extends StatefulWidget {
  const TestWidgetKeys4({super.key});

  @override
  State<TestWidgetKeys4> createState() => _TestWidgetKeys4State();
}

class _TestWidgetKeys4State extends State<TestWidgetKeys4> {
  late final List<Widget> _children;

  @override
  void initState() {
    super.initState();
    _children = [_TestStfKeys(key: ValueKey("key_1")), _TestStfKeys(key: ValueKey("key_2"))];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _children.insert(0, _children.removeAt(1));
          });
        },
      ),
      appBar: AppBar(title: Text("Test keys 4")),
      body: Row(children: _children),
    );
  }
}

class _TestKeys extends StatelessWidget {
  const _TestKeys({super.key, required this.color});

  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(width: 100, height: 100, color: color);
  }
}

class _TestStfKeys extends StatefulWidget {
  const _TestStfKeys({super.key});

  @override
  State<_TestStfKeys> createState() => _TestStfKeysState();
}

class _TestStfKeysState extends State<_TestStfKeys> {
  late final Color _color;

  @override
  void initState() {
    super.initState();
    _color = Colors.primaries[Random().nextInt(Colors.primaries.length)];
    print("calling f initiState");
  }

  @override
  Widget build(BuildContext context) {
    return Container(width: 100, height: 100, color: _color);
  }
}
