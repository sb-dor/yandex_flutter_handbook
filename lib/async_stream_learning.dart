import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: AsyncStreamLearningMaterialApp()));
}

class StreamProvider {
  final StreamController<int> _streamController = StreamController.broadcast();

  Stream<int> get stream => _streamController.stream;

  void addToController(int number) {
    _streamController.add(number);
  }

  void close() => _streamController.close();
}

class AsyncStreamLearningMaterialApp extends StatelessWidget {
  const AsyncStreamLearningMaterialApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: AsyncStreamLearningWidget());
  }
}

class AsyncStreamLearningWidget extends StatefulWidget {
  const AsyncStreamLearningWidget({super.key});

  @override
  State<AsyncStreamLearningWidget> createState() => _AsyncStreamLearningWidgetState();
}

class _AsyncStreamLearningWidgetState extends State<AsyncStreamLearningWidget> {
  final StreamProvider _streamLearning = StreamProvider();
  final List<int> _streamIntegers = [];
  late final StreamSubscription _streamLearningSubs;

  @override
  void initState() {
    super.initState();
    _streamLearningSubs = _streamLearning.stream.listen(_streamListener);
  }

  void _streamListener(int number) {
    setState(() {
      _streamIntegers.add(number);
    });
  }

  @override
  void dispose() {
    _streamLearningSubs.cancel();
    _streamLearning.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Steams with controller")),
      body: Center(
        child: TextButton(
          onPressed: () {
            _streamLearning.addToController(Random().nextInt(100));
          },
          child: Text("$_streamIntegers"),
        ),
      ),
    );
  }
}
