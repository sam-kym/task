import 'package:action/features/apple_model.dart';
import 'package:flutter/cupertino.dart';

class AppleProvider with ChangeNotifier {
  final List<ProductApple> _products = [
    ProductApple(
      'Apple',
      35,
      'assets/images/apple.jpeg', // Add the path to your apple image asset
      'Fresh and delicious apples.',
    ),
  ];

  List<ProductApple> get products => _products;

  void addProduct(ProductApple product) {
    _products.add(product);
    notifyListeners();
  }

  void removeProduct(int index) {
    _products.removeAt(index);
    notifyListeners();
  }// ... (other methods remain the same)
}
