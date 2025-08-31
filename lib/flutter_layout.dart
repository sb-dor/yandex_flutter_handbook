import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(home: FlutterLayout()));

class FlutterLayout extends StatefulWidget {
  const FlutterLayout({super.key});

  @override
  State<FlutterLayout> createState() => _FlutterLayoutState();
}

class _FlutterLayoutState extends State<FlutterLayout> {
  @override
  Widget build(BuildContext context) {
    return Test5();
  }
}

class _Test1 extends StatelessWidget {
  const _Test1({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(width: 100, height: 100, color: Colors.red);
  }
}

class Test2 extends StatelessWidget {
  const Test2({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(child: Container(width: 100, height: 100, color: Colors.red));
  }
}

class Test3 extends StatelessWidget {
  const Test3({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 100,
        height: 100,
        padding: const EdgeInsets.all(20),
        color: Colors.red,
        child: Row(children: [Container(width: 50, height: 50, color: Colors.green)]),
      ),
    );
  }
}

class Test4 extends StatelessWidget {
  const Test4({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(width: 100, height: 100, color: Colors.red),
        SizedBox(height: 10),
        Container(
          color: Colors.yellow,
          height: 40,
          child: Column(
            children: [
              Container(width: 20, height: 20, color: Colors.green),
              Container(height: 30, width: 30, color: Colors.orange),
            ],
          ),
        ),
      ],
    );
  }
}

class Test5 extends StatelessWidget {
  const Test5({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ConstrainedBox(
          constraints: BoxConstraints(maxWidth: 10),
          child: ColoredBox(color: Colors.blue, child: Text("111")),
        ),
        SizedBox(width: 10),
        ConstrainedBox(
          constraints: BoxConstraints(maxHeight: 200),
          child: Column(
            children: [
              Container(width: 20, height: 20, color: Colors.green),
              Container(height: 30, width: 30, color: Colors.orange),
              Container(height: 30, width: 30, color: Colors.orange),
              Container(height: 30, width: 30, color: Colors.orange),
              Container(height: 30, width: 30, color: Colors.orange),
              Container(height: 30, width: 30, color: Colors.orange),
              Container(height: 30, width: 30, color: Colors.orange),
            ],
          ),
        ),
        SizedBox()
      ],
    );
  }
}
