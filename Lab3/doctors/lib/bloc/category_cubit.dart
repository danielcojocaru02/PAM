import 'dart:convert';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/services.dart'; // For loading assets
import '../models/category.dart';  // Import the Category model

// Category states
abstract class CategoryState {}

class CategoryInitialState extends CategoryState {}

class CategoryLoadingState extends CategoryState {}

class CategoryLoadedState extends CategoryState {
  final List<Category> categories;

  CategoryLoadedState(this.categories);
}

class CategoryErrorState extends CategoryState {
  final String error;

  CategoryErrorState(this.error);
}

// CategoryCubit
class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit() : super(CategoryInitialState());

  // Fetch categories from the JSON file
  Future<void> fetchCategoriesFromJson() async {
    emit(CategoryLoadingState());
    try {
      // Load categories from the JSON file
      String jsonString = await rootBundle.loadString('assets/doctors.json');
      final Map<String, dynamic> jsonData = json.decode(jsonString);

      // Parse categories
      final List<dynamic> categoriesJson = jsonData['categories'];
      List<Category> categories = categoriesJson
          .map((categoryJson) => Category.fromJson(categoryJson))
          .toList();

      emit(CategoryLoadedState(categories));  // Emit loaded categories
    } catch (e) {
      emit(CategoryErrorState("Failed to load categories: $e"));
    }
  }
}
