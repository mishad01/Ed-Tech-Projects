import 'package:flutter/material.dart';
import 'package:recipe_book/data/service/api_service.dart';
import 'package:recipe_book/domain/entities/recipe.dart';

class RecipeProvider extends ChangeNotifier {
  ApiService _apiService = ApiService();

  List<Recipe> _categoryRecipes = [];
  List<Recipe> get categoryRecipes => _categoryRecipes;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  List<Recipe> _searchResults = [];
  List<Recipe> get searchResults => _searchResults;

  Future<void> fetchRecipesByCategory(String category) async {
    _isLoading = true;
    notifyListeners();
    try {
      _categoryRecipes = await _apiService.getRecipesByCategory(category);
      print(
        'Fetched ${_categoryRecipes.length} recipes for category: $category',
      );
    } catch (e) {
      print('Error fetching recipes: $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> searchRecipes(String query) async {
    _isLoading = true;
    notifyListeners();
    try {
      _searchResults = await _apiService.searchRecipes(query);
    } catch (e) {
      print('Error searching recipes: $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  void clearSearchResults() {
    _searchResults = [];
    notifyListeners();
  }
}
