import 'package:flutter/material.dart';

Color getCategoryColor(String category) {
  switch (category.toLowerCase()) {
    case 'music':
      return Colors.purple;
    case 'tech':
    case 'technology':
      return Colors.blue;
    case 'food':
      return Colors.orange;
    case 'art':
      return Colors.pink;
    case 'sports':
      return Colors.green;
    case 'community':
      return Colors.teal;
    case 'entertainment':
      return Colors.red;
    case 'business':
      return Colors.indigo;
    case 'health':
      return Colors.lightGreen;
    default:
      return Colors.grey;
  }
}
