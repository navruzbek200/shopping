import 'package:flutter/material.dart';

class Product {
  final String id;
  final String title;
  final String category;
  final String price;
  final Color bg;
  final String asset;
  final double rating;
  final int reviewsCount;

  const Product({
    required this.id,
    required this.title,
    required this.category,
    required this.price,
    required this.bg,
    required this.asset,
    required this.rating,
    required this.reviewsCount,
  });
}
