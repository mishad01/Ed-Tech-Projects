import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:receipe_book/core/app_colors.dart';
import 'package:receipe_book/presentation/features/provider/recipe_provider.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();
  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.surface,
      appBar: AppBar(
        backgroundColor: AppColors.surface,
        title: TextField(
          controller: _searchController,
          decoration: InputDecoration(
            hintText: 'Search recipes...',
            border: InputBorder.none,
          ),
        ),
        actions: [
          Row(
            children: [
              IconButton(
                icon: Icon(Icons.search),
                onPressed: () {
                  if (_searchController.text.isNotEmpty) {
                    context.read<RecipeProvider>().searchRecipes(
                      _searchController.text,
                    );
                  }
                },
              ),
              IconButton(
                icon: Icon(Icons.clear),
                onPressed: () {
                  if (_searchController.text.isNotEmpty) {
                    context.read<RecipeProvider>().clearSearchResults();
                  }
                },
              ),
            ],
          ),
        ],
      ),
      body: Consumer<RecipeProvider>(
        builder: (context, recipeProvider, child) {
          return ListView.builder(
            itemCount: recipeProvider.searchResults.length,
            itemBuilder: (context, index) {
              final recipe = recipeProvider.searchResults[index];
              return Container(
                margin: EdgeInsets.symmetric(horizontal: 8),
                padding: EdgeInsets.symmetric(horizontal: 8),
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.network(
                            recipe.image,
                            width: 80,
                            height: 80,
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                recipe.title,
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.star,
                                    color: Colors.yellow,
                                    size: 16,
                                  ),
                                  Text(
                                    '4.5',
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
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
                        ),
                        Icon(Icons.bookmark, color: Colors.red, size: 26),
                      ],
                    ),

                    Divider(
                      color: Colors.grey.withValues(alpha: 0.5),
                      thickness: 1,
                      height: 32,
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
