import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(home: _TestStatelessWidgetAsStf1()));

class _TestStatelessWidgetAsStf1 extends StatelessWidget {
  const _TestStatelessWidgetAsStf1();

  @override
  StatelessElement createElement() => _TestStatelessElement(widget: this);

  @override
  Widget build(BuildContext context) =>
      Text("test widget which is not necessary if you are creating your own impl for element");
}

class _TestStatelessElement extends StatelessElement {
  _TestStatelessElement({required StatelessWidget widget}) : _widget = widget, super(widget);

  @override
  final StatelessWidget _widget;

  void ownSetState(final void Function() fn) {
    fn();
    markNeedsBuild();
  }

  int cnt = 0;

  // in real impl of StatelessElement - build method calls widget's build method sending itself - element or BuildContext (as you call)
  @override
  Widget build() => Scaffold(
    appBar: AppBar(title: Text("Test stateless element as stfEl")),
    body: SizedBox.expand(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextButton(
            onPressed: () {
              cnt++;
              ownSetState(() {});
            },
            child: Text("Click to inc: $cnt"),
          ),
          _widget.build(this), // this - is element (BuildContext)
        ],
      ),
    ),
  );
}
