import 'package:flutter/material.dart';
import 'package:yandex_flutter_handbook/cart_stream/cart_adding_widget.dart';
import 'package:yandex_flutter_handbook/cart_stream/cart_stream_controller.dart';
import 'package:yandex_flutter_handbook/test_class_1.dart';

import '../remember_oop_3.dart';

class CartStreamWidget extends StatefulWidget {
  const CartStreamWidget({super.key});


  @override
  State<CartStreamWidget> createState() => CartStreamWidgetState();
}

class CartStreamWidgetState extends State<CartStreamWidget> {
  late final CartStreamController _cartStreamController;

  @override
  void initState() {
    super.initState();
    _cartStreamController = CartAddingInhWidget.of(context).cartStreamController;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Title"),
      ),
      body: StreamBuilder(
        stream: _cartStreamController.cartItemStream,
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
            case ConnectionState.waiting:
              return Center(child: Text("Empty data in stream"));
            case ConnectionState.active:
            case ConnectionState.done:
              final data = snapshot.requireData as CartWithDiscount;
              return CustomScrollView(
                slivers: [
                  SliverList.builder(
                    itemCount: data.cartItems.length,
                    itemBuilder: (context, index) {
                      final cartItem = data.cartItems[index];
                      return Card(
                        margin: const EdgeInsets.all(8),
                        child: ListTile(
                          leading: Icon(
                            cartItem is Assortment ? Icons.shopping_bag : Icons.shopping_cart,
                          ),
                          title: Text(
                            "ID: ${cartItem.productInh.id} - - - - ${data.qtyOfProduct(cartItem.productInh.id)}",
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          subtitle: cartItem is Assortment
                              ? Text(
                                  "Bundle with ${(cartItem as Assortment).products.length} products",
                                )
                              : const Text("Single product"),
                          trailing: Text(
                            "\$${cartItem.productInh.price.toStringAsFixed(2)}",
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.green,
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
