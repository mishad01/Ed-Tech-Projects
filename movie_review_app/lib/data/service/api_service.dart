import 'dart:convert';

import 'package:flutter/rendering.dart';
import 'package:movie_review_app/core/app_strings.dart';
import 'package:movie_review_app/data/model/movie_model.dart';
import 'package:movie_review_app/domain/enitites/movie.dart';
import 'package:http/http.dart' as http;

class ApiService {
  Future<List<Movie>> getTrendingMovies() async {
    final url = Uri.parse('${AppStrings.baseUrl}/trending/movie/week');
    final response = await http.get(
      url,
      headers: {
        'Authorization': AppStrings.authorizationToken,
        'accept': 'application/json',
      },
    );

    debugPrint('Response status: ${response.statusCode}');
    debugPrint('Response body: ${response.body}');

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      final List results = json['results'];
      return results.map((movie) => MovieModel.fromJson(movie)).toList();
    } else {
      throw Exception('Failed to load trending movies');
    }
  }

  Future<Map<String, dynamic>> getMovieDetails(int movieId) async {
    final url = Uri.parse('${AppStrings.baseUrl}/movie/$movieId');
    final response = await http.get(
      url,
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
