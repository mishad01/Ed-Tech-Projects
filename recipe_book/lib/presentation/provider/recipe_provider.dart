import 'package:flutter/material.dart';
import 'package:recipe_book/data/service/api_service.dart';
import 'package:recipe_book/domain/entities/recipe.dart';

class RecipeProvider extends ChangeNotifier {
  final ApiService _apiService = ApiService();

  List<Recipe> _cateforyRecipes = [];
  List<Recipe> get categoryRecipes => _cateforyRecipes;

  List<Recipe> _searchResults = [];
  List<Recipe> get searchResults => _searchResults;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<void> fetchRecipesByCategory(String category) async {
    _isLoading = true;
    notifyListeners();
    try {
      _cateforyRecipes = await _apiService.getRecipesByCategory(category);
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
