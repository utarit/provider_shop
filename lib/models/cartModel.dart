import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

class CartModel extends ChangeNotifier {
  List<Tuple> cart = List<Tuple>();

  void addProduct(Product product) {
    cart.add(Tuple(product, 1));

    notifyListeners();
  }

  void removeProduct(UniqueKey key) {
    for (Tuple tuple in cart) {
      if (tuple.product.key == key) {
        cart.remove(tuple);
        break;
      }
    }
    notifyListeners();
  }

  void incQuantity(UniqueKey key) {
    for (Tuple tuple in cart) {
      if (tuple.product.key == key) {
        tuple.quantity++;
        notifyListeners();
        return;
      }
    }
  }

  void decQuantity(UniqueKey key) {
    for (Tuple tuple in cart) {
      if (tuple.product.key == key && tuple.quantity > 1) {
        tuple.quantity--;
        notifyListeners();
        return;
      }
    }
  }

  void clearCart() {
    cart.clear();

    notifyListeners();
  }
}

class Product {
  UniqueKey key;
  String name;
  int price;
  String imageUrl;
  String description;

  Product(this.key, {this.name = "", this.price = 0, this.imageUrl = "", this.description = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."});
}

class Tuple {
  Product product;
  int quantity;

  Tuple(this.product, this.quantity);
}
