void main() {
  final assortment = Assortment([Product(10), Product(12)]);
  final product = Product(25);

  CartWithDiscount cartWithDiscount = CartWithDiscount(
    cartItems: [CartItem(assortment, 2), CartItem(product, 1)],
  );
  print(cartWithDiscount.total);
  print(cartWithDiscount.totalWithDiscount(10));
  cartWithDiscount.printEachItemPrice();
}

sealed class ProductInh {
  double get price;
}

class Product extends ProductInh {
  Product(this._price);

  final double _price;

  @override
  double get price => _price;
}

class Assortment extends ProductInh {
  Assortment(this._products);

  final List<Product> _products;

  @override
  double get price => _products.fold(0.0, (sum, prod) => sum += prod.price);
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

mixin DiscountMixin on Cart {
  double totalWithDiscount(double discountPercent) {
    if (discountPercent <= 0) return total;
    return total - (total * discountPercent / 100);
  }
}

mixin TotalCartMixin on Cart {
  void printEachItemPrice() {
    for (final each in cartItems) {
      print(each.cartItem.price);
    }
  }
}

class CartWithDiscount = Cart with DiscountMixin, TotalCartMixin;

class Cart {
  const Cart({this.cartItems = const []});

  final List<CartItem> cartItems;

  double get total => cartItems.fold(0.0, (sum, item) => sum += item.total);
}

class CartItem {
  CartItem(this.cartItem, this.qty);

  final ProductInh cartItem;
  final double qty;

  double get total => cartItem.price * qty;
}
