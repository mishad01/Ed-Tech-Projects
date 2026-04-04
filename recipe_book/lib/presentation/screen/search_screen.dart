import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipe_book/core/app_colors.dart';
import 'package:recipe_book/presentation/provider/recipe_provider.dart';
import 'package:recipe_book/presentation/widget/search_recipe_card.dart';

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
            icon: Icon(Icons.clear),
            onPressed: () {
              _searchController.clear();
              context.read<RecipeProvider>().clearSearchResults();
            },
          ),
        ],
      ),
      body: Consumer<RecipeProvider>(
        builder: (context, provider, child) {
          if (provider.isLoading) {
            return Center(child: CircularProgressIndicator());
          }
          if (provider.searchResults.isEmpty) {
            return Center(child: Text('No results found'));
          }
          return ListView.builder(
            itemCount: provider.searchResults.length,
            itemBuilder: (context, index) {
              return SearchRecipeCard(recipe: provider.searchResults[index]);
            },
          );
        },
      ),
    );
  }
}
