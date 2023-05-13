import 'package:flutter/cupertino.dart';
import '../models/product_model.dart';

class LikeController extends ChangeNotifier {
  Map addProducts = {};

  void addProduct({required Product product}) {
    if (addProducts.containsKey(product)) {
      addProducts[product] += 1;
    } else {
      addProducts[product] = 1;
    }
    notifyListeners();
  }

  void removeProduct({required Product product}) {
    addProducts.removeWhere((key, value) => key == product);
    notifyListeners();
  }
}