import 'package:recipe_book/domain/entities/recipe.dart';

class RecipeModel extends Recipe {
  RecipeModel({required super.id, required super.title, required super.image});

  factory RecipeModel.fromJson(Map<String, dynamic> json) {
    return RecipeModel(
      id: json['id'],
      title: json['title'],
      image: json['image'],
    );
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'title': title, 'image': image};
  }
}
