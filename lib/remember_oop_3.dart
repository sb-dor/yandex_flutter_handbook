import 'package:collection/collection.dart';

void main() {
  final assortment = Assortment(1, [Product(1, 10), Product(2, 12)]);
  final product = Product(3, 25);

  CartWithDiscount cartWithDiscount = CartWithDiscount(
    cartItems: [CartItem(assortment, 2), CartItem(product, 1)],
  );
  print(cartWithDiscount.total);
  print(cartWithDiscount.totalWithDiscount(10));
  // cartWithDiscount.printEachItemPrice();
  // cartWithDiscount.printEachItemType();
  cartWithDiscount.addToCart(CartItem(Product(4, 66), 1));
  print(cartWithDiscount.total);
  print(cartWithDiscount.totalWithDiscount(10));
}

sealed class ProductInh {
  int get id;

  double get price;
}

class Product extends ProductInh {
  Product(this._id, this._price);

  final int _id;
  final double _price;

  @override
  double get price => _price;

  @override
  int get id => _id;
}

class Assortment extends ProductInh {
  Assortment(this._id, this.products);

  final int _id;
  final List<Product> products;

  @override
  double get price => products.fold(0.0, (sum, prod) => sum += prod.price);

  @override
  int get id => _id;
}
//
//
//
//
//
//
//
//
//
//
//
//
//

mixin Prices on Cart {
  double totalWithDiscount(double discountPercent) {
    if (discountPercent <= 0) return total;
    return total - (total * discountPercent / 100);
  }

  double get averagePrice => total / cartItems.length;
}

mixin TotalCartMixin on Cart {
  void printEachItemPrice() {
    for (final each in cartItems) {
      print(each.productInh.price);
    }
  }

  void printEachItemType() {
    for (final each in cartItems) {
      print(each.productInh.runtimeType);
    }
  }
}

mixin AddToCart on Cart {
  void addToCart(CartItem cartItem) {
    cartItems.add(cartItem);
  }

  void removeFromCart(ProductInh productType) {
    cartItems.removeWhere((element) => element.productInh.id == productType.id);
  }
}

mixin QtyOfProducts on Cart {
  int get qtyOfAllSelectedProducts => cartItems.fold(0, (sum, item) => sum += item.qty.toInt());

  int qtyOfProduct(int id) =>
      cartItems.firstWhereOrNull((el) => el.productInh.id == id)?.qty.toInt() ?? 0;
}

class CartWithDiscount = Cart with Prices, TotalCartMixin, AddToCart, QtyOfProducts;

class Cart {
  const Cart({this.cartItems = const []});

  final List<CartItem> cartItems;

  double get total => cartItems.fold(0.0, (sum, item) => sum += item.total);
}

class CartItem {
  CartItem(this.productInh, this.qty);

  final ProductInh productInh;
  final double qty;

  double get total => productInh.price * qty;
}
