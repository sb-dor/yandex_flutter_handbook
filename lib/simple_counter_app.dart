// for integration test

import 'package:flutter/material.dart';

class CounterWidget extends StatefulWidget {
  const CounterWidget({super.key});

  @override
  State<CounterWidget> createState() => _CounterWidgetState();
}

class _CounterWidgetState extends State<CounterWidget> {
  int _counter = 0;

  void _increment() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text("Counter Test")),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("You have pushed the button this many times:"),
              Text(
                '$_counter',
                key: const Key('counterText'),
                style: const TextStyle(fontSize: 32),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          key: ValueKey('incrementButton'),
          onPressed: _increment,
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
