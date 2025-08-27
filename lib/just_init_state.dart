import 'dart:math';

import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(home: JustInitState()));

class JustInitState extends StatefulWidget {
  const JustInitState({super.key});

  @override
  State<JustInitState> createState() => _JustInitStateState();
}

class _JustInitStateState extends State<JustInitState> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Just init state")),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(child: _JustInitStateLess()),
          SliverToBoxAdapter(child: _JustInitStateful()),
          SliverToBoxAdapter(child: _JustInitStateful()),
          SliverToBoxAdapter(
            child: TextButton(
              onPressed: () {
                setState(() {});
              },
              child: Text("Set state"),
            ),
          ),
        ],
      ),
    );
  }
}

class _JustInitStateLess extends StatelessWidget {
  const _JustInitStateLess();

  @override
  Widget build(BuildContext context) {
    return Container(width: 100, height: 100, color: Colors.primaries[Random().nextInt(5)]);
  }
}

class _JustInitStateful extends StatefulWidget {
  const _JustInitStateful();

  @override
  State<_JustInitStateful> createState() => _JustInitStatefulState();
}

class _JustInitStatefulState extends State<_JustInitStateful> {
  @override
  void didUpdateWidget(covariant _JustInitStateful oldWidget) {
    print("did update widget");
    super.didUpdateWidget(oldWidget);
  }

  final Color _color = Colors.primaries[Random().nextInt(5)];

  @override
  Widget build(BuildContext context) {
    return Container(width: 100, height: 100, color: _color);
  }
}
