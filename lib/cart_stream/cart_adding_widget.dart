import 'dart:async';

import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:yandex_flutter_handbook/cart_stream/cart_stream_controller.dart';
import 'package:yandex_flutter_handbook/cart_stream/cart_stream_widget.dart';

import '../remember_oop_3.dart';

void main() {
  runApp(CartAddingWidgetMaterialApp());
}

class CartAddingWidgetMaterialApp extends StatelessWidget {
  const CartAddingWidgetMaterialApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: CartAddingWidget(), debugShowCheckedModeBanner: false);
  }
}

class CartAddingInhWidget extends InheritedWidget {
  const CartAddingInhWidget({super.key, required super.child, required this.state});

  static CartAddingWidgetState of(BuildContext context) {
    final widget = context.getElementForInheritedWidgetOfExactType<CartAddingInhWidget>()?.widget;
    final isWidget = widget is CartAddingInhWidget;
    assert(isWidget, "CartStreamInjWidget not found in context");
    return (widget as CartAddingInhWidget).state;
  }

  final CartAddingWidgetState state;

  @override
  bool updateShouldNotify(old) {
    return false;
  }
}

class CartAddingWidget extends StatefulWidget {
  const CartAddingWidget({super.key});

  @override
  State<CartAddingWidget> createState() => CartAddingWidgetState();
}

class CartAddingWidgetState extends State<CartAddingWidget> {
  //
  final CartStreamController cartStreamController = CartStreamController();

  @override
  Widget build(BuildContext context) {
    return CartAddingInhWidget(state: this, child: _CartAddingWidgetUI());
  }
}

class _CartAddingWidgetUI extends StatefulWidget {
  const _CartAddingWidgetUI();

  @override
  State<_CartAddingWidgetUI> createState() => _CartAddingWidgetUIState();
}

class _CartAddingWidgetUIState extends State<_CartAddingWidgetUI> {
  late final CartStreamController _cartStreamController;
  late final StreamSubscription<Cart> _cartStreamSubs;

  @override
  void initState() {
    super.initState();
    _cartStreamController = CartAddingInhWidget.of(context).cartStreamController;
    _cartStreamSubs = _cartStreamController.cartItemStream
        .listen(
          (data) {
            print("subs coming data: $data");
            if (data.cartItems.length == 4) {
              _cartStreamSubs.cancel();
            }
          },
          onDone: () {
            print("on Stream done");
          },
          onError: (error) {
            print("on Stream error");
          },
        );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Title"),
        actions: [
          StreamBuilder(
            stream: _cartStreamController.cartItemStream,
            builder: (context, snapshot) {
              final currentState = CartAddingInhWidget.of(context);
              return TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) =>
                          CartAddingInhWidget(state: currentState, child: CartStreamWidget()),
                    ),
                  );
                },
                child: Text("LENGTH: ${snapshot.data?.cartItems.length ?? ''}"),
              );
            },
          ),
        ],
      ),
      body: CustomScrollView(
        slivers: [
          SliverList.builder(
            itemCount: items.length,
            itemBuilder: (context, index) {
              final cartItem = items[index];
              return GestureDetector(
                onTap: () => _cartStreamController.add(cartItem),
                child: Card(
                  margin: const EdgeInsets.all(8),
                  child: ListTile(
                    leading: Icon(
                      cartItem is Assortment ? Icons.shopping_bag : Icons.shopping_cart,
                    ),
                    title: Text(
                      "ID: ${cartItem.id}",
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: cartItem is Assortment
                        ? Text("Bundle with ${cartItem.products.length} products")
                        : const Text("Single product"),
                    trailing: Text(
                      "\$${cartItem.price.toStringAsFixed(2)}",
                      style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.green),
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
