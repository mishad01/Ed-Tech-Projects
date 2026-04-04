import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipe_book/core/app_colors.dart';
import 'package:recipe_book/core/app_strings.dart';
import 'package:recipe_book/presentation/provider/recipe_provider.dart';
import 'package:recipe_book/presentation/screen/search_screen.dart';
import 'package:recipe_book/presentation/widget/recipe_Card.dart';

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
    'Thai',
  ];

  String _selectedCategory = 'All';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<RecipeProvider>().fetchRecipesByCategory(_selectedCategory);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.surface,
      appBar: AppBar(
        backgroundColor: AppColors.surface,
        centerTitle: false,
        title: Column(
          crossAxisAlignment: .start,
          children: [
            Text(
              AppStrings.welcomeBack,
              style: TextStyle(color: AppColors.textSecondary, fontSize: 16),
            ),
            Text(
              'Emon Ahmed Likhon',
              style: TextStyle(
                color: AppColors.black,
                fontSize: 16,
                fontWeight: .w600,
              ),
            ),
          ],
        ),
        leading: Padding(
          padding: const EdgeInsets.all(6.0),
          child: ClipRRect(
            borderRadius: .circular(100),
            child: Image.network(AppStrings.profileImageUrl),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SearchScreen()),
              );
            },
            icon: Icon(Icons.search),
          ),
          SizedBox(width: 20),
          Icon(Icons.notifications),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: .start,
          children: [
            Text(
              AppStrings.categories,
              style: TextStyle(
                color: AppColors.textPrimary,
                fontSize: 18,
                fontWeight: .w600,
              ),
            ),

            _buildCategoryList(),

            Expanded(
              child: Consumer<RecipeProvider>(
                builder: (context, provider, child) {
                  if (provider.isLoading) {
                    return Center(child: CircularProgressIndicator());
                  }

                  if (provider.categoryRecipes.isEmpty) {
                    return Center(
                      child: Text('No recipes found for this category.'),
                    );
                  }
                  return ListView.builder(
                    padding: .zero,
                    clipBehavior: .none,
                    scrollDirection: .horizontal,
                    itemCount: provider.categoryRecipes.length,
                    itemBuilder: (context, index) {
                      return RecipeCard(
                        recipe: provider.categoryRecipes[index],
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryList() {
    return SizedBox(
      height: 60,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final category = categories[index];
          final isSelected = category == _selectedCategory;
          return Padding(
            padding: const EdgeInsets.all(4.0),
            child: GestureDetector(
              onTap: () {
                if (_selectedCategory == category) return;

                setState(() {
                  _selectedCategory = category;
                  context.read<RecipeProvider>().fetchRecipesByCategory(
                    _selectedCategory,
                  );
                });
              },
              child: Center(
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    color: isSelected ? AppColors.primary : AppColors.surface,
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(
                      color: isSelected ? AppColors.primary : AppColors.grey200,
                      width: 1,
                    ),
                  ),
                  child: Text(
                    categories[index],
                    style: TextStyle(
                      color: isSelected
                          ? Colors.white
                          : AppColors.textSecondary,
                      fontSize: 16,
                      fontWeight: .w600,
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
