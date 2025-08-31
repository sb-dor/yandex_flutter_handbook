import 'dart:developer';

import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: App()));
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  void initState() {
    super.initState();
    _defaultLogging();
  }

  void _defaultLogging() {
    log('This is a verbose message', name: 'logging file', level: 200);
    log('This is a debug message', name: 'MyApp', level: 300);
    log('This is an info message', name: 'MyApp', level: 400);
    log('This is a warning message', name: 'MyApp', level: 500);
    log('This is an error message', name: 'MyApp', level: 1000);
    log('This is a critical/fatal message', name: 'MyApp', level: 2000);
  }

  void _logging() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
