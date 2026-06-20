import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/core/app_colors.dart';
import 'package:weather_app/core/weather_helper.dart';
import 'package:weather_app/presentation/feature/home/provider/weather_provider.dart';
import 'package:weather_app/presentation/feature/home/widget/current_weather_card.dart';
import 'package:weather_app/presentation/feature/home/widget/search_bar_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _searchController = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<WeatherProvider>(context, listen: false).fetchWeather('Dhaka');
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _searchController.dispose();
  }

  void _onSearch() {
    final query = _searchController.text.trim();
    if (query.isEmpty) return;
    FocusScope.of(context).unfocus();
    Provider.of<WeatherProvider>(context, listen: false).fetchWeather(query);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<WeatherProvider>(
      builder: (context, provider, child) {
        final colors = provider.weatherResult != null
            ? WeatherHelper.getGradientColors(
                provider.weatherResult!.current.weatherCode,
              )
            : AppColors.sunnyGradient;

        return Scaffold(
          body: Stack(
            children: [
              AnimatedContainer(
                duration: const Duration(milliseconds: 500),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: colors,
                  ),
                ),
                child: SafeArea(
                  child: Column(
                    children: [
                      SearchBarWidget(
                        controller: _searchController,
                        onSearch: _onSearch,
                      ),
                      _buildBody(provider),
                    ],
                  ),
                ),
              ),
              if (provider.isLoading && provider.weatherResult != null)
                Positioned(
                  top: 16,
                  right: 16,
                  child: SizedBox(
                    height: 20,
                    width: 20,
                    child: CircularProgressIndicator(color: Colors.white),
                  ),
                ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildBody(WeatherProvider provider) {
    if (provider.weatherResult == null) {
      return const SizedBox.shrink();
    }
    final weather = provider.weatherResult!;
    return CurrentWeatherCard(
      cityName: provider.cityName!,
      weather: weather.current,
    );
  }
}
