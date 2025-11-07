import 'package:flutter/material.dart';
import '../models/product.dart';

class ProductProvider extends ChangeNotifier {
  final List<Product> _products = [
    Product(id: '1', name: 'iPhone 15', price: 999, image: '📱'),
    Product(id: '2', name: 'MacBook Pro', price: 2499, image: '💻'),
    Product(id: '3', name: 'AirPods Pro', price: 249, image: '🎧'),
    Product(id: '4', name: 'iPad Air', price: 599, image: '📱'),
    Product(id: '5', name: 'Apple Watch', price: 399, image: '⌚'),
    Product(id: '6', name: 'Magic Mouse', price: 79, image: '🖱️'),
  ];

  List<Product> get products => _products;

  List<Product> _favorites = [];
  List<Product> get favorites => _favorites;

  void toggleFavorite(Product product) {
    if (_favorites.contains(product)) {
      _favorites.remove(product);
    } else {
      _favorites.add(product);
    }
    notifyListeners();
  }

  bool isFavorite(Product product) {
    return _favorites.contains(product);
  }
}
