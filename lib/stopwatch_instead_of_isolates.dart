import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: TestAnimation()));
}

class TestAnimation extends StatefulWidget {
  const TestAnimation({super.key});

  @override
  State<TestAnimation> createState() => _TestAnimationState();
}

class _TestAnimationState extends State<TestAnimation> {
  // exactly, it's good to create isolate
  // but there are moments that you don't have to create isolate for this kinda functions
  void function() async {
    // try to remove stopwatch and see the way UI freezes
    final stopWatch = Stopwatch()..start();
    for (int i = 0; i < 100000000000; i++) {
      // some sync operations
      if (stopWatch.elapsedMilliseconds > 8) {
        await Future.delayed(Duration.zero);
      }
    }
    stopWatch.stop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Test animation")),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            function();
          },
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}