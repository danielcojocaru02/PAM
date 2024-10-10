import 'package:flutter/material.dart';

class CategoriesContainer extends StatelessWidget {
  const CategoriesContainer({super.key});

  @override
  Widget build(BuildContext context) {
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
        // Grid of categories with icons
        SizedBox(
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
              return buildIconCard(category['name'], category['image'], category['color']);
            },
          ),
        ),
      ],
    );
  }

  // Method to build each icon card
Widget buildIconCard(String label, String imagePath, Color color) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      // Shape with icon
      Container(
        height: 70, // Adjust height as needed
        width: 70, // Fixed width for the shape
        decoration: BoxDecoration(
          color: color,
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

// Example categories data
final List<Map<String, dynamic>> categories = [
  {'name': 'Dentistry', 'image': 'assets/icons/dentistry.png', 'color': const Color(0xFFDC9497)},
  {'name': 'Cardiology', 'image': 'assets/icons/cardiology.png', 'color': const Color(0xFF93C19E)},
  {'name': 'Pulmonology', 'image': 'assets/icons/pulmonology.png', 'color': const Color(0xFFF5AD7E)},
  {'name': 'General', 'image': 'assets/icons/general.png', 'color': const Color(0xFFACA1CD)},
  {'name': 'Neurology', 'image': 'assets/icons/neurology.png', 'color': const Color(0xFF4D9B91)},
  {'name': 'Gastroent.', 'image': 'assets/icons/gastro.png', 'color': const Color(0xFF352261)},
  {'name': 'Laboratory', 'image': 'assets/icons/laboratory.png', 'color': const Color(0xFFDEB6B5)},
  {'name': 'Vaccination', 'image': 'assets/icons/vaccination.png', 'color': const Color(0xFF89CCDB)},
];
