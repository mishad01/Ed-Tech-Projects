import 'package:flutter/material.dart';
import 'package:movie_review_app/core/app_colors.dart';
import 'package:movie_review_app/presenation/provider/movie_provider.dart';
import 'package:movie_review_app/presenation/screens/details/movie_details.dart';
import 'package:movie_review_app/presenation/screens/home/movie_card.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.microtask(
      () => Provider.of<MovieProvider>(
        context,
        listen: false,
      ).fetchTrendingMovies(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      appBar: AppBar(
        title: const Text('Movie Review App'),
        backgroundColor: AppColors.primary,
      ),
      body: Column(
        children: [
          Consumer<MovieProvider>(
            builder: (context, provider, _) {
              return Expanded(
                child: ListView.builder(
                  itemCount: provider.trendingMovies.length,
                  itemBuilder: (context, index) {
                    final movie = provider.trendingMovies[index];
                    return MovieCard(
                      movie: movie,
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MovieDetails(movie: movie),
                        ),
                      ),
                    );
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
