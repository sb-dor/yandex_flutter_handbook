import 'package:flutter/material.dart';

import 'text_controller_debounce.dart';

void main() => runApp(MaterialApp(home: TextControllerDebounceWidget()));

class TextControllerDebounceWidget extends StatefulWidget {
  const TextControllerDebounceWidget({super.key});

  @override
  State<TextControllerDebounceWidget> createState() => _TextControllerDebounceWidgetState();
}

class _TextControllerDebounceWidgetState extends State<TextControllerDebounceWidget> {
  late final TextEditingController _textEditingController;
  late final TextControllerDebounceController _textControllerDebounceController;

  @override
  void initState() {
    super.initState();
    _textEditingController = TextEditingController();
    _textControllerDebounceController = TextControllerDebounceController(
      textEditingController: _textEditingController,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: TextField(
              controller: _textEditingController,
              decoration: InputDecoration(hintText: "Debounce time"),
            ),
          ),
          SliverToBoxAdapter(
            child: Text(
              "Debounced",
              style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
            ),
          ),
          SliverToBoxAdapter(
            child: StreamBuilder(
              stream: _textControllerDebounceController.debouncedTextStream,
              builder: (context, snapShot) {
                switch (snapShot.connectionState) {
                  case ConnectionState.none:
                  case ConnectionState.waiting:
                    return Center(child: CircularProgressIndicator());
                  case ConnectionState.active:
                  case ConnectionState.done:
                    return Text(snapShot.requireData);
                }
              },
            ),
          ),
          SliverToBoxAdapter(
            child: Text(
              "Distinct",
              style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
            ),
          ),
          SliverToBoxAdapter(
            child: StreamBuilder(
              stream: _textControllerDebounceController.distinct,
              builder: (context, snapShot) {
                switch (snapShot.connectionState) {
                  case ConnectionState.none:
                  case ConnectionState.waiting:
                    return Center(child: CircularProgressIndicator());
                  case ConnectionState.active:
                  case ConnectionState.done:
                    return Text(snapShot.requireData);
                }
              },
            ),
          ),
          SliverToBoxAdapter(
            child: Text(
              "Filter",
              style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
            ),
          ),
          SliverToBoxAdapter(
            child: StreamBuilder(
              stream: _textControllerDebounceController.filter,
              builder: (context, snapShot) {
                switch (snapShot.connectionState) {
                  case ConnectionState.none:
                  case ConnectionState.waiting:
                    return Center(child: CircularProgressIndicator());
                  case ConnectionState.active:
                  case ConnectionState.done:
                    return Text(snapShot.requireData);
                }
              },
            ),
          ),

          SliverToBoxAdapter(
            child: Text(
              "Skp while",
              style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
            ),
          ),
          SliverToBoxAdapter(
            child: StreamBuilder(
              stream: _textControllerDebounceController.skipWhile,
              builder: (context, snapShot) {
                switch (snapShot.connectionState) {
                  case ConnectionState.none:
                  case ConnectionState.waiting:
                    return Center(child: CircularProgressIndicator());
                  case ConnectionState.active:
                  case ConnectionState.done:
                    return Text(snapShot.requireData);
                }
              },
            ),
          ),

          SliverToBoxAdapter(
            child: Text(
              "Buffer count",
              style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
            ),
          ),
          SliverToBoxAdapter(
            child: StreamBuilder(
              stream: _textControllerDebounceController.bufferCount,
              builder: (context, snapShot) {
                switch (snapShot.connectionState) {
                  case ConnectionState.none:
                  case ConnectionState.waiting:
                    return Center(child: CircularProgressIndicator());
                  case ConnectionState.active:
                  case ConnectionState.done:
                    return Text(snapShot.requireData.toString());
                }
              },
            ),
          ),

          SliverToBoxAdapter(
            child: Text(
              "Buffer time",
              style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
            ),
          ),
          SliverToBoxAdapter(
            child: StreamBuilder(
              stream: _textControllerDebounceController.bufferTime,
              builder: (context, snapShot) {
                switch (snapShot.connectionState) {
                  case ConnectionState.none:
                  case ConnectionState.waiting:
                    return Center(child: CircularProgressIndicator());
                  case ConnectionState.active:
                  case ConnectionState.done:
                    return Text(snapShot.requireData.toString());
                }
              },
            ),
          ),

          SliverToBoxAdapter(
            child: Text(
              "Throttle time",
              style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
            ),
          ),
          SliverToBoxAdapter(
            child: StreamBuilder(
              stream: _textControllerDebounceController.throttleTime,
              builder: (context, snapShot) {
                switch (snapShot.connectionState) {
                  case ConnectionState.none:
                  case ConnectionState.waiting:
                    return Center(child: CircularProgressIndicator());
                  case ConnectionState.active:
                  case ConnectionState.done:
                    return Text(snapShot.requireData.toString());
                }
              },
            ),
          ),

          SliverToBoxAdapter(
            child: Text(
              "Mapped stream",
              style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
            ),
          ),
          SliverToBoxAdapter(
            child: StreamBuilder(
              stream: _textControllerDebounceController.mapped,
              builder: (context, snapShot) {
                switch (snapShot.connectionState) {
                  case ConnectionState.none:
                  case ConnectionState.waiting:
                    return Center(child: CircularProgressIndicator());
                  case ConnectionState.active:
                  case ConnectionState.done:
                    return Text(snapShot.requireData.toString());
                }
              },
            ),
          ),
        ],

      ),
    );
  }
}
