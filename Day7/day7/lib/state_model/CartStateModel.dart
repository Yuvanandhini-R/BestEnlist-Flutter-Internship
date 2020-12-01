import 'package:day7/model/product_model.dart';
import 'package:flutter/material.dart';

class CartStateModel extends ChangeNotifier {
  List<ProductModel> _productModels = [];

  List<ProductModel> get productModels => _productModels;

  void add(ProductModel productModel) {
    _productModels.add(productModel);
    notifyListeners();
  }

  void delete(int id) {
    int index;

    for (int i = 0; i < _productModels.length; i++) {
      if (_productModels[i].id == id) {
        index = i;
        break;
      }
    }

    if (index != null) {
      _productModels.removeAt(index);
      notifyListeners();
    }
  }

  double totalPrice() {
    double total = .0;

    for (var i in _productModels) {
      total += i.price;
    }

    return total;
  }
}
