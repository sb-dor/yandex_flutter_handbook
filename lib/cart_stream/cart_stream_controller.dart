import 'dart:async';

import 'package:rxdart/rxdart.dart';

import '../remember_oop_3.dart';

final List<ProductInh> items = [
  Product(1, 10.5),
  Product(2, 20.0),
  Product(3, 7.25),
  Assortment(4, [Product(5, 15.0), Product(6, 25.5)]),
  Assortment(7, [Product(8, 5.0), Product(9, 12.5), Product(10, 30.0)]),
];

class CartStreamController {
  CartStreamController() {
    cart = CartWithDiscount(cartItems: <CartItem>[]);
  }

  // final StreamController<Cart> _cartStreamController = StreamController.broadcast();

  final BehaviorSubject<Cart> _cartStreamController = BehaviorSubject();

  Stream<Cart> get cartItemStream => _cartStreamController.stream;

  late CartWithDiscount cart;

  void add(ProductInh product) {
    cart.addToCart(CartItem(product, 1));
    _cartStreamController.sink.add(cart);
  }
}
