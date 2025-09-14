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
    _children = [_TestStfKeys(key: ValueKey(0)), _TestStfKeys(key: ValueKey(1))];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              setState(() {
                _children.insert(0, _children.removeAt(1));
              });
            },
          ),
          FloatingActionButton(
            onPressed: () {
              setState(() {
                _children.removeAt(0);
                _children.insert(0, _TestStfKeys(key: ValueKey(Random().nextInt(100))));
              });
            },
          ),
        ],
      ),
      appBar: AppBar(title: Text("Test keys 4")),
      body: Row(children: _children),
    );
  }
}

class _TestKeys extends StatelessWidget {
  const _TestKeys({required this.color});

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
  int _counter = 0;

  @override
  void initState() {
    super.initState();
    _color = Colors.primaries[Random().nextInt(Colors.primaries.length)];
    print("calling f initiState");
  }

  @override
  void didUpdateWidget(covariant _TestStfKeys oldWidget) {
    print("calling f didUpdateWidget");
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    print("calling f dispose");
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _counter++;
        });
      },
      child: Container(
        width: 100,
        height: 100,
        color: _color,
        child: Center(child: Text("$_counter")),
      ),
    );
  }
}
