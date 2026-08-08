import 'package:flutter/material.dart';
import 'package:movie_review_app/data/service/api_service.dart';
import 'package:movie_review_app/domain/enitites/movie.dart';

class MovieProvider extends ChangeNotifier {
  final ApiService _apiService = ApiService();

  List<Movie> _trendingMovies = [];
  List<Movie> get trendingMovies => _trendingMovies;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  Future<void> fetchTrendingMovies() async {
    _isLoading = true;
    notifyListeners();
    try {
      _trendingMovies = await _apiService.getTrendingMovies();
      notifyListeners();
    } catch (e) {
      print('Error fetching trending movies: $e');
      _errorMessage = 'Failed to load trending movies';
      notifyListeners();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<Map<String, dynamic>> fetchMovieDetails(int movieId) async {
    _isLoading = true;
    notifyListeners();
    try {
      return await _apiService.getMovieDetails(movieId);
    } catch (e) {
      print('Error fetching movie details: $e');
      _errorMessage = 'Failed to load movie details';
      notifyListeners();
      return {};
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
