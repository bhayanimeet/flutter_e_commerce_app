import 'package:flutter/cupertino.dart';
import '../models/product_model.dart';

class CartController extends ChangeNotifier {
  Map addProducts = {};

  get totalQuantity => addProducts.length;

  get totalPrice {
    int totalPrice = 0;

    totalPrice = addProducts.entries
        .map((e) => e.key.price * e.value)
        .toList()
        .reduce((value, element) => value + element);

    return totalPrice;
  }

  void addProduct({required Product product}) {
    if (addProducts.containsKey(product)) {
      addProducts[product] += 1;
    } else {
      addProducts[product] = 1;
    }
    notifyListeners();
  }

  void removeProduct({required Product product}) {
    if (addProducts.containsKey(product) && addProducts[product] == 1) {
      addProducts.removeWhere((key, value) => key == product);
    } else {
      addProducts[product] -= 1;
    }
    notifyListeners();
  }

  void remove({required Product product}) {
    addProducts.removeWhere((key, value) => key == product);
    notifyListeners();
  }
}