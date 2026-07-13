import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:movie_review_app/core/app_strings.dart';
import 'package:movie_review_app/data/model/movie_model.dart';
import 'package:movie_review_app/domain/entities/movie.dart';
import 'package:http/http.dart' as http;

class ApiService {
  Future<List<Movie>> getTrendingMovies() async {
    final url = Uri.parse('${AppStrings.baseUrl}/trending/all/week');
    final response = await http.get(
      url,
      headers: {'Authorization': AppStrings.authorizationToken},
    );

    debugPrint('Response status: ${response.statusCode}');
    debugPrint('Response body: ${response.body}');

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      final List result = json['results'];
      return result.map((e) => MovieModel.fromJson(e)).toList();
    } else {
      throw Exception();
    }
  }

  Future<Map<String, dynamic>> getMovieDetails(int movieId) async {
    final url = Uri.parse('${AppStrings.baseUrl}/movie/$movieId');
    final response = await http.get(
      url,
      headers: {'Authorization': AppStrings.authorizationToken},
    );

    debugPrint('Response status: ${response.statusCode}');
    debugPrint('Response body: ${response.body}');

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      return json;
    } else {
      throw Exception();
    }
  }
}
