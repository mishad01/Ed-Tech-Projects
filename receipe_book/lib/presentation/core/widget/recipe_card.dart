import 'package:flutter/material.dart';
import 'package:receipe_book/domain/entities/recipe.dart';

class RecipeCard extends StatelessWidget {
  const RecipeCard({super.key, required this.recipe});
  final Recipe recipe;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 154,
      width: 156,
      child: Column(
        crossAxisAlignment: .start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  recipe.image,
                  height: 154,
                  width: 156,
                  fit: BoxFit.cover,
                ),
              ),

              Positioned(
                top: 8,
                left: 8,
                child: Row(
                  children: [
                    Container(
                      width: 50,
                      height: 30,
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(18),
                      ),
                      child: Row(
                        children: [
                          Icon(Icons.star, color: Colors.yellow, size: 16),
                          Text(
                            '4.5',
                            style: TextStyle(color: Colors.white, fontSize: 14),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 70),
                    Icon(Icons.bookmark, color: Colors.red, size: 26),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 8),
          Text(
            recipe.title,
            style: TextStyle(
              color: Colors.black,
              fontSize: 13,
              fontWeight: FontWeight.bold,
              overflow: TextOverflow.ellipsis,
            ),
            maxLines: 2,
            // textAlign: TextAlign.center,
          ),
          Text(
            'By: Kadin Curtis',
            style: TextStyle(
              color: Colors.blueGrey,
              fontSize: 12,
              fontWeight: FontWeight.w600,
              overflow: TextOverflow.ellipsis,
            ),
            maxLines: 2,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
