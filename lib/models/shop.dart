import 'package:flutter/material.dart';

import 'food.dart';

class Shop extends ChangeNotifier {
  final List<Food> _foodMenu = [
    Food(
      name: 'Bento Sushi',
      price: '21.97',
      imagePath: 'lib/images/bentosushi.png',
      rating: '4.7',
    ),
    Food(
      name: '3-in-1 sushi package',
      price: '35.97',
      imagePath: 'lib/images/manysushi.png',
      rating: '4.8',
    ),
    Food(
      name: 'Traditional Sushi',
      price: '18.97',
      imagePath: 'lib/images/plainsushi.png',
      rating: '4.7',
    ),
    Food(
      name: 'Rice Sushi',
      price: '24.97',
      imagePath: 'lib/images/ricesushi.png',
      rating: '4.7',
    ),
  ];

  // customer cart
  final List<Food> _cart = [];

  // getter methods
  List<Food> get foodMenu => _foodMenu;
  List<Food> get cart => _cart;

  // add to cart
  void addToCart(Food foodItem, int quantity) {
    for (int i = 0; i < quantity; i++) {
      _cart.add(foodItem);
    }
    notifyListeners();
  }

  // remove from cart
  void removeFromCart(Food food) {
    _cart.remove(food);
    notifyListeners();
  }
}

//
