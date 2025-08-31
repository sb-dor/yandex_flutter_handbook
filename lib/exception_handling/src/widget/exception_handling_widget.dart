import 'package:flutter/material.dart';

class ExceptionHandlingWidget extends StatefulWidget {
  const ExceptionHandlingWidget({super.key});

  @override
  State<ExceptionHandlingWidget> createState() => _ExceptionHandlingWidgetState();
}

class _ExceptionHandlingWidgetState extends State<ExceptionHandlingWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text("Test")));
  }
}
