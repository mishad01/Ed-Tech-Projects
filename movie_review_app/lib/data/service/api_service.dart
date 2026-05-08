import 'dart:convert';

import 'package:movie_review_app/core/app_strings.dart';
import 'package:movie_review_app/data/model/movie_model.dart';
import 'package:movie_review_app/domain/entities/movie.dart';
import 'package:http/http.dart' as http;

class ApiService {
  Future<List<Movie>> getTrendingMovies() async {
    final response = await http.get(
      Uri.parse('${AppStrings.baseUrl}/trending/all/week'),
      headers: {
        'Authorization': AppStrings.authorizationToken,
        'accept': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      final List results = json['results'];
      return results.map((e) => MovieModel.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load trending movies');
    }
  }

  Future<List<Movie>> searchMovies(String query) async {
    final response = await http.get(
      Uri.parse('${AppStrings.baseUrl}/search/movie?query=$query'),
      headers: {
        'Authorization': AppStrings.authorizationToken,
        'accept': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      final List results = json['results'];
      return results.map((e) => MovieModel.fromJson(e)).toList();
    } else {
      throw Exception('Failed to search movies');
    }
  }

  Future<Map<String, dynamic>> getMovieDetails(int movieId) async {
    final response = await http.get(
      Uri.parse('${AppStrings.baseUrl}/movie/$movieId'),
      headers: {
        'Authorization': AppStrings.authorizationToken,
        'accept': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load movie details');
    }
  }
}
