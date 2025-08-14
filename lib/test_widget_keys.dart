import 'dart:math';

import 'package:flutter/material.dart';
import 'package:yandex_flutter_handbook/test_colored_container.dart';

class TestWidgetKeys extends StatefulWidget {
  const TestWidgetKeys({super.key});

  @override
  State<TestWidgetKeys> createState() => _TestWidgetKeysState();
}

class _TestWidgetKeysState extends State<TestWidgetKeys> {
  List<Widget> _children = [];
  bool _showNewTextField = false;

  // with keys you can determine who is who in widget tree
  // for example you have a widget that has it's own logic inside itself
  // and you will create that widget several times in listview
  // so if you change some of them or even change the places, flutter does not understand what happened

  // so if you want to change places and keep the state of widget you have to use keys

  @override
  void initState() {
    super.initState();
    final random = Random().nextInt(Colors.primaries.length - 2);
    _children = [
      Padding(
        key: ValueKey<String>(Colors.primaries[random].toString()),
        padding: const EdgeInsets.all(8.0),
        child: TestColoredContainer(color: Colors.primaries[random]),
      ),
      Padding(
        key: ValueKey<String>(Colors.primaries[random + 1].toString()),
        padding: const EdgeInsets.all(8.0),
        child: TestColoredContainer(color: Colors.primaries[random + 1]),
      ),
      Padding(
        key: ValueKey<String>(Colors.primaries[random + 2].toString()),

        padding: const EdgeInsets.all(8.0),
        child: TestColoredContainer(color: Colors.primaries[random + 2]),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _children = _children.reversed.toList();
            _showNewTextField = !_showNewTextField;
          });
        },
      ),
      body: SizedBox.expand(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [..._children],
        ),
      ),
    );
  }
}
