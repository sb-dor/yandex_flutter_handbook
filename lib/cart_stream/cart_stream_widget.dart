import 'package:flutter/material.dart';
import 'package:yandex_flutter_handbook/cart_stream/cart_stream_controller.dart';

import '../remember_oop_3.dart';

void main() {
  runApp(CartStreamWidgetMaterialApp());
}

class CartStreamWidgetMaterialApp extends StatelessWidget {
  const CartStreamWidgetMaterialApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: CartStreamWidget());
  }
}

class CartStreamWidget extends StatefulWidget {
  const CartStreamWidget({super.key});

  @override
  State<CartStreamWidget> createState() => _CartStreamWidgetState();
}

class _CartStreamWidgetState extends State<CartStreamWidget> {
  //
  final CartStreamController _cartStreamController = CartStreamController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Title"),
        actions: [
          TextButton(
            onPressed: () {
              _cartStreamController.add(Product(1, 10));
            },
            child: Text("Add"),
          ),
        ],
      ),
      body: StreamBuilder(
        stream: _cartStreamController.cartItemStream,
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
            case ConnectionState.waiting:
              return Center(child: CircularProgressIndicator());
            case ConnectionState.active:
            case ConnectionState.done:
              final data = snapshot.requireData;
              return CustomScrollView(
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
                              "ID: ${cartItem.id} - - - - ${data.cartItems.length}",
                              style: const TextStyle(fontWeight: FontWeight.bold),
                            ),
                            subtitle: cartItem is Assortment
                                ? Text(
                                    "Bundle with ${cartItem.products.length} products",
                                  )
                                : const Text("Single product"),
                            trailing: Text(
                              "\$${cartItem.price.toStringAsFixed(2)}",
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.green,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ],
              );
          }
        },
      ),
    );
  }
}
