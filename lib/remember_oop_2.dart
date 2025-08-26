void main() {
  final assortment = Assortment([Product(10), Product(12)]);
  final product = Product(25);

  final cart = Cart(cartItems: [CartItem(assortment, 2), CartItem(product, 1)]);
  print(cart.total);
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
  Assortment(this.products);

  final List<Product> products;

  @override
  double get price => products.fold(0.0, (sum, prod) => sum += prod.price);
}

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
