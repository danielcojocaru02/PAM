import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/category_cubit.dart';  // Import the CategoryCubit
import '../models/category.dart';    // Import the Category model

class CategoriesContainer extends StatelessWidget {
  const CategoriesContainer({super.key});

  @override
  Widget build(BuildContext context) {
    // Trigger fetching categories when widget is built
    context.read<CategoryCubit>().fetchCategoriesFromJson();

    return Column(
      children: [
        // Header for Categories with "See All" on the right
        const SizedBox(
          height: 70,
          child: Row(
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(left: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Categories',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.all(8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'See All',
                        style: TextStyle(
                          color: Colors.blue,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        // BlocListener to handle different category states
        BlocBuilder<CategoryCubit, CategoryState>(
          builder: (context, state) {
            if (state is CategoryLoadingState) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is CategoryErrorState) {
              return Center(child: Text('Error: ${state.error}'));
            } else if (state is CategoryLoadedState) {
              List<Category> categories = state.categories;

              return SizedBox(
                height: 220, // Give a fixed height for the grid view
                child: GridView.builder(
                  padding: const EdgeInsets.all(16),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4, // Number of icons per row
                    crossAxisSpacing: 2,
                    mainAxisSpacing: 10,
                    childAspectRatio: 1, // Aspect ratio for icon containers
                  ),
                  itemCount: categories.length, // Number of categories
                  itemBuilder: (context, index) {
                    final category = categories[index];
                    return buildIconCard(category.name, category.image, category.color);
                  },
                ),
              );
            }
            return const SizedBox.shrink();
          },
        ),
      ],
    );
  }

  // Method to build each icon card
  Widget buildIconCard(String label, String imagePath, String color) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Shape with icon
        Container(
          height: 70, // Adjust height as needed
          width: 70, // Fixed width for the shape
          decoration: BoxDecoration(
            color: Color(int.parse('0xFF' + color.substring(1))),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
            child: Image.asset(
              imagePath,
              height: 40,
              color: Colors.white,
            ),
          ),
        ),
        const SizedBox(height: 5), // Spacing between shape and text
        // Text label
        Text(
          label,
          style: const TextStyle(
            color: Colors.black, // Change to desired color
            fontSize: 12,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}
