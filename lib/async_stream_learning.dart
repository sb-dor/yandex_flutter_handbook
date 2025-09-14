import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: AsyncStreamLearningMaterialApp()));
}

class StreamProvider {
  // simple StreamController constructor creates Simple-subscription-stream
  // which means subscriber will get all data from stream even if he was not subscribed
  // So for .broadcast it doesn't work
  final StreamController<int> _streamController = StreamController(
    // works when everyone unsubscribes from stream
    onCancel: () {
      print("on cancel");
    },
    // works whenever someone subscribes to stream
    // onListen runs only once, when the first subscription is created
    onListen: () {
      print("on listen");
    },
    // on pause (broadcast constructor does not have this method)
    onPause: () {
      print("onPause");
    },
    // on resume (broadcast constructor does not have this method)
    onResume: () {
      print("onResume");
    },
  );

  Stream<int> get stream => _streamController.stream;

  void addToController(int number) {
    if (!_streamController.isClosed) _streamController.sink.add(number);
  }

  void close() => _streamController.close();

  void error() => _streamController.addError(Exception());
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

    _streamLearning.addToController(11);
    _streamLearning.addToController(15);
    Future.delayed(const Duration(seconds: 3), () async {
      // you can either do like this
      _streamLearningSubs = _streamLearning.stream
          // if stream has an error, and you catch them in handleError
          // you cant handle errors indie listen's onError
          .handleError((error) {
            print("stream is error: $error");
          })
          .listen(
            // onData
            _streamListener,
            // onError
            onError: (error) {
              print("sub is error: $error");
            },
            // will be called whenever streamController is closed
            onDone: () {
              print("sub is done");
            },
            cancelOnError: true,
          );

      // or like this
      // but remember that this kind of job never handles errors
      // await for (final each in _streamLearning.stream) {
      //   _streamListener(each);
      // }
    });
  }

  void _streamListener(int number) {
    setState(() {
      _streamIntegers.add(number);
    });
  }

  void _pause() => _streamLearningSubs.pause();

  void _resume() => _streamLearningSubs.resume();

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
      body: SizedBox.expand(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () {
                _streamLearning.addToController(Random().nextInt(100));
              },
              child: Text("$_streamIntegers"),
            ),
            TextButton(
              onPressed: () {
                _pause();
              },
              child: Text("Pause stream"),
            ),
            TextButton(
              onPressed: () {
                _resume();
              },
              child: Text("Resume stream"),
            ),
            TextButton(
              onPressed: () {
                _streamLearning.close();
              },
              child: Text("Close stream"),
            ),
            TextButton(
              onPressed: () {
                _streamLearning.error();
              },
              child: Text("Error stream"),
            ),
          ],
        ),
      ),
    );
  }
}
