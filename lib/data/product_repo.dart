import 'package:flutter/material.dart';
import '../models/product.dart';

class ProductRepo {
  static const products = <Product>[
    Product(
      id: '1',
      title: 'Orange Chair',
      category: 'Furniture',
      price: '\$879.00',
      bg: Color(0xFFD8F3FF),
      asset: 'assets/images/chair.png',
      rating: 4.0,
      reviewsCount: 124,
    ),
    Product(
      id: '2',
      title: 'Road Bike',
      category: 'Sport',
      price: '\$2800.00',
      bg: Color(0xFFF7DDD2),
      asset: 'assets/images/bike.png',
      rating: 4.6,
      reviewsCount: 86,
    ),
    Product(
      id: '3',
      title: 'Water Bottle',
      category: 'Home',
      price: '\$219.00',
      bg: Color(0xFFF6E3B6),
      asset: 'assets/images/bottle.png',
      rating: 4.3,
      reviewsCount: 45,
    ),
    Product(
      id: '4',
      title: 'Backpack',
      category: 'Fashion',
      price: '\$165.00',
      bg: Color(0xFFDFF6F3),
      asset: 'assets/images/bag.png',
      rating: 4.2,
      reviewsCount: 62,
    ),
  ];

  static Product byId(String id) {
    return products.firstWhere((p) => p.id == id);
  }
}
