import 'package:movie_review_app/domain/entities/movie.dart';

class MovieModel extends Movie {
  MovieModel({
    required super.id,
    required super.title,
    required super.voteAverage,
    required super.releaseDate,
    required super.genreIds,
    super.posterPath,
    super.backdropPath,
    super.overview,
  });

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    return MovieModel(
      id: json['id'],
      title: json['title'] ?? json['name'] ?? 'Unknown Title',
      posterPath: json['poster_path'],
      backdropPath: json['backdrop_path'],
      voteAverage: (json['vote_average'] as num).toDouble(),
      releaseDate:
          json['release_date'] ??
          json['first_air_date'] ??
          'Unknown Release Date',
      genreIds: List<int>.from(json['genre_ids']),
      overview: json['overview'] ?? 'No overview available',
    );
  }
}
