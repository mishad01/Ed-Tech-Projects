import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:recipe_book/core/app_colors.dart';
import 'package:recipe_book/domain/entities/recipe.dart';

class SearchRecipeCard extends StatelessWidget {
  const SearchRecipeCard({super.key, required this.recipe});

  final Recipe recipe;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: CachedNetworkImage(
                  imageUrl: recipe.image,
                  width: 78,
                  height: 78,
                  fit: BoxFit.cover,
                  placeholder: (context, url) => Container(
                    width: 78,
                    height: 78,
                    color: AppColors.grey200,
                  ),
                  errorWidget: (context, url, error) => Container(
                    width: 78,
                    height: 78,
                    color: AppColors.grey200,
                    child: const Icon(Icons.broken_image, color: AppColors.grey),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            recipe.title,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                              height: 22 / 16,
                              color: Color(0xFF171621),
                            ),
                          ),
                          const SizedBox(height: 5),
                          Row(
                            children: const [
                              Icon(
                                Icons.star_rounded,
                                color: AppColors.starColor,
                                size: 16,
                              ),
                              SizedBox(width: 5),
                              Text(
                                '4.5',
                                style: TextStyle(
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14,
                                  height: 22 / 14,
                                  color: Color(0xFF1F2116),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 8),
                    const Icon(
                      Icons.bookmark_rounded,
                      color: AppColors.primary,
                      size: 20,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        const Divider(height: 1, thickness: 1, indent: 24, endIndent: 24),
      ],
    );
  }
}
