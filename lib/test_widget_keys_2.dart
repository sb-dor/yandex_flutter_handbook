import 'dart:math';

import 'package:flutter/material.dart';

class TestWidgetKeys2 extends StatefulWidget {
  const TestWidgetKeys2({super.key});

  @override
  State<TestWidgetKeys2> createState() => _TestWidgetKeys2State();
}

class _TestWidgetKeys2State extends State<TestWidgetKeys2> {
  List<Widget> _widgets = [];

  @override
  void initState() {
    super.initState();
    _widgets = List.generate(
      3,
      (i) => _TestingWidgetWithKeyAndState(
        key: ValueKey("key_$i"),
        uniqueNumber: (i + 1) * Random().nextInt(100),
      ),
    ).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Test widget keys 2")),
      floatingActionButton: FloatingActionButton(
        child: Text("Shuffle"),
        onPressed: () {
          setState(() {
            final copyList = List.of(_widgets);
            copyList.shuffle();
            copyList.removeLast();
            final id = Random().nextInt(100);
            copyList.add(
              _TestingWidgetWithKeyAndState(
                key: ValueKey("key_$id"),
                uniqueNumber: (id + 1) * Random().nextInt(100),
              ),
            );
            _widgets = copyList;
          });
        },
      ),
      body: SafeArea(child: ListView(children: _widgets)),
    );
  }
}

class _TestingWidgetWithKeyAndState extends StatefulWidget {
  const _TestingWidgetWithKeyAndState({super.key, required this.uniqueNumber});

  final int uniqueNumber;

  @override
  State<_TestingWidgetWithKeyAndState> createState() => _TestingWidgetWithKeyAndStateState();
}

class _TestingWidgetWithKeyAndStateState extends State<_TestingWidgetWithKeyAndState> {
  int _counter = 0;

  void increment() {
    setState(() {
      _counter++;
    });
  }

  // if there is same widget or same key with widget
  // this will be called
  @override
  void didUpdateWidget(covariant _TestingWidgetWithKeyAndState oldWidget) {
    print("did update widget: $oldWidget");
    super.didUpdateWidget(oldWidget);
  }

  @override
  void didChangeDependencies() {
    print("did change dependencies");
    super.didChangeDependencies();
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
    return SizedBox(
      width: 100,
      height: 100,
      child: Column(
        children: [
          TextButton(
            onPressed: () {
              increment();
            },
            child: Text("uniqueKey ${widget.uniqueNumber}: $_counter"),
          ),
        ],
      ),
    );
  }
}
