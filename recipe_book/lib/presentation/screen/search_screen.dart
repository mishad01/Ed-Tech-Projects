import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipe_book/core/app_colors.dart';
import 'package:recipe_book/presentation/provider/recipe_provider.dart';
import 'package:recipe_book/presentation/widget/recipe_card.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _searchController.dispose();
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
          onSubmitted: (value) {
            if (value.isNotEmpty) {
              context.read<RecipeProvider>().searchRecipes(value);
            }
          },
        ),
        actions: [
          IconButton(
            onPressed: () {
              _searchController.clear();
            },
            icon: Icon(Icons.cancel),
          ),
        ],
      ),
      body: Consumer<RecipeProvider>(
        builder: (context, provider, child) {
          if (provider.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (provider.searchResults.isEmpty) {
            return const Center(child: Text('No recipes found'));
          }
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView.builder(
              itemCount: provider.searchResults.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 10),
                  child: Column(
                    children: [
                      ListTile(
                        leading: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: CachedNetworkImage(
                            imageUrl: provider.searchResults[index].image,
                            height: 78,
                            width: 60,
                            fit: BoxFit.cover,
                          ),
                        ),
                        title: Column(
                          crossAxisAlignment: .start,
                          children: [
                            Text(provider.searchResults[index].title),
                            Row(
                              children: [
                                Icon(
                                  Icons.star,
                                  color: AppColors.starColor,
                                  size: 14,
                                ),
                                Text(
                                  '4.5',
                                  style: TextStyle(color: Colors.black),
                                ),
                              ],
                            ),
                          ],
                        ),
                        trailing: Icon(
                          Icons.bookmark_add,
                          size: 25,
                          color: AppColors.primary,
                        ),
                      ),
                      Divider(color: AppColors.grey200, thickness: 1),
                    ],
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
