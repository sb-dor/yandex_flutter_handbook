import 'dart:math';

import 'package:flutter/material.dart';

class TestWidgetKeys3 extends StatefulWidget {
  const TestWidgetKeys3({super.key});

  @override
  State<TestWidgetKeys3> createState() => _TestWidgetKeys3State();
}

class _TestWidgetKeys3State extends State<TestWidgetKeys3> {
  List<int> _integers = [];

  @override
  void initState() {
    super.initState();
    _integers = List.generate(3, (i) => Random().nextInt(100)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Test widget keys 2")),
      floatingActionButton: FloatingActionButton(
        child: Text("Shuffle"),
        onPressed: () {
          setState(() {
            final copiesList = List.of(_integers);
            copiesList.shuffle();
            _integers = copiesList;
          });
        },
      ),
      body: SafeArea(
        child: ListView.builder(
          itemCount: _integers.length,
          itemBuilder: (context, index) {
            return Dismissible(
              key: ValueKey("key_${_integers.first}"),
              onDismissed: (_) => setState(() {
                _integers.removeAt(index);
              }),
              child: _TestingWidgetWithKeyAndState(uniqueNum: _integers[index]),
            );
          },
        ),
      ),
    );
  }
}

class _TestingWidgetWithKeyAndState extends StatefulWidget {
  const _TestingWidgetWithKeyAndState({super.key, required this.uniqueNum});

  final int uniqueNum;

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

  @override
  void dispose() {
    super.dispose();
    print("dispose ${widget.uniqueNum}");
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
            child: Text("index of ${widget.uniqueNum}: $_counter"),
          ),
        ],
      ),
    );
  }
}
