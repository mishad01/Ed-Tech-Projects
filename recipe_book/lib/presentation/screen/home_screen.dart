import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:recipe_book/core/app_colors.dart';
import 'package:recipe_book/core/app_strings.dart';
import 'package:recipe_book/presentation/screen/search_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String> categories = [
    'All',
    'Italian',
    'Chinese',
    'Mexican',
    'Indian',
    'French',
    'Japanese',
  ];

  final String _selectedCategory = 'All';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.surface,
      appBar: AppBar(
        backgroundColor: AppColors.surface,
        title: Column(children: [Text('Recipe Book'), Text('Recipe Book')]),
        centerTitle: false,
        leading: Padding(
          padding: const EdgeInsets.all(6.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(100),
            child: CachedNetworkImage(imageUrl: AppStrings.profileImageUrl),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SearchScreen()),
              );
            },
            icon: const Icon(Icons.search),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: .start,
            children: [
              Text(
                'Categories',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
              _buildCategoryCard(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCategoryCard() {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: categories.length,
      itemBuilder: (context, index) {
        final category = categories[index];
        final isSelected = category == _selectedCategory;
        return Container(
          height: 100,
          padding: .symmetric(horizontal: 16, vertical: 8),
          child: Text(
            category,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: isSelected ? AppColors.primary : AppColors.grey,
            ),
          ),
        );
      },
    );
  }
}
