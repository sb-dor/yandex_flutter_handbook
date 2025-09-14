import 'dart:math';

import 'package:flutter/material.dart';

class TestWidgetKeys5 extends StatefulWidget {
  const TestWidgetKeys5({super.key});

  @override
  State<TestWidgetKeys5> createState() => _TestWidgetKeys5State();
}

class _TestWidgetKeys5State extends State<TestWidgetKeys5> {
  List<Widget> _children = [];

  @override
  void initState() {
    super.initState();
    _children = [
      _TestDidUpdateWidgetNoKeys(
        color: Colors.primaries[Random().nextInt(Colors.primaries.length)],
      ),
      _TestDidUpdateWidgetNoKeys(
        color: Colors.primaries[Random().nextInt(Colors.primaries.length)],
      ),
      _TestDidUpdateWidgetNoKeys(
        color: Colors.primaries[Random().nextInt(Colors.primaries.length)],
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Test widget keys 5")),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            final copiedList = List.of(_children)..shuffle();
            _children = copiedList;
          });
        },
        child: Icon(Icons.change_circle),
      ),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [SliverToBoxAdapter(child: Row(children: _children))],
        ),
      ),
    );
  }
}

class _TestDidUpdateWidgetNoKeys extends StatefulWidget {
  const _TestDidUpdateWidgetNoKeys({required this.color});

  final Color color;

  @override
  State<_TestDidUpdateWidgetNoKeys> createState() => _TestDidUpdateWidgetNoKeysState();
}

class _TestDidUpdateWidgetNoKeysState extends State<_TestDidUpdateWidgetNoKeys> {
  Color? _color;

  @override
  void initState() {
    super.initState();
    _color = widget.color;
  }

  @override
  void didUpdateWidget(covariant _TestDidUpdateWidgetNoKeys oldWidget) {
    _color = widget.color;
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return Container(width: 100, height: 100, color: _color);
  }
}
