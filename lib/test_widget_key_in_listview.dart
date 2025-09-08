import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(home: TestWidgetKeyInListview()));

class TestWidgetKeyInListview extends StatefulWidget {
  const TestWidgetKeyInListview({super.key});

  @override
  State<TestWidgetKeyInListview> createState() => _TestWidgetKeyInListviewState();
}

class _TestWidgetKeyInListviewState extends State<TestWidgetKeyInListview> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.separated(
        separatorBuilder: (context, index) => SizedBox(height: 100),
        itemCount: 100,
        itemBuilder: (context, index) {
          return _ItemInList(key: ValueKey("item_in_list_$index"));
        },
      ),
    );
  }
}

class _ItemInList extends StatefulWidget {
  const _ItemInList({super.key});

  @override
  State<_ItemInList> createState() => _ItemInListState();
}

class _ItemInListState extends State<_ItemInList> {
  @override
  void initState() {
    print("calling initState");
    super.initState();
  }

  @override
  void dispose() {
    print("calling dispose");
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant _ItemInList oldWidget) {
    print('calling didupdate widget');
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return Text("NUMBER IN LIST:");
  }
}
