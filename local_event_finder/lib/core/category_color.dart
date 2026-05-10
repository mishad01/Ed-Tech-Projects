import 'package:flutter/material.dart';

Color getCategoryColor(String category) {
  switch (category.toLowerCase()) {
    case 'music':
      return Colors.purple;
    case 'technology':
      return Colors.blue;
    case 'food':
      return Colors.orange;
    case 'art':
      return Colors.pink;
    case 'sports':
      return Colors.green;
    case 'entertainment':
      return Colors.red;
    case 'business':
      return Colors.teal;
    case 'literature':
      return Colors.brown;
    case 'health':
      return Colors.lightGreen;
    case 'film':
      return Colors.deepPurple;
    default:
      return Colors.grey;
  }
}
