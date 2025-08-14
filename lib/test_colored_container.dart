import 'package:flutter/material.dart';

class TestColoredContainer extends StatefulWidget {
  const TestColoredContainer({super.key, required this.color});

  final Color color;

  @override
  State<TestColoredContainer> createState() => _TestColoredContainerState();
}

class _TestColoredContainerState extends State<TestColoredContainer> {
  late Color color;

  @override
  void initState() {
    super.initState();
    color = widget.color;
  }

  void _changeColor() {
    color = Colors.blue;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _changeColor,
      child: Container(width: 100, height: 100, color: color),
    );
  }
}
