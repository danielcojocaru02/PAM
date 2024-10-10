import 'package:flutter/material.dart';

class DoctorsContainer extends StatelessWidget {
  const DoctorsContainer({super.key});

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
                        '532 founds',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Default ',
                      style: TextStyle(
                        color: Colors.blue,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        // Horizontal List of Doctors
        SizedBox(
          height: 1000, // Fixed height for the card list
          child: ListView.builder(
            scrollDirection: Axis.vertical, // Make the list vertical
            padding: const EdgeInsets.symmetric(horizontal: 16),
            itemCount: centers.length, // Number of centers
            itemBuilder: (context, index) {
              final center = centers[index];
              return buildCenterCard(center);
            },
          ),
        ),
      ],
    );
  }

  // Method to build each doctor's card
  Widget buildCenterCard(Map<String, dynamic> center) {
    return Container(
      width: double.infinity, // Make the card take full width
      margin: const EdgeInsets.only(bottom: 16), // Margin between cards
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 8,
            spreadRadius: 2,
            offset: Offset(0, 2),
          ),
        ],
        color: Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image section
            Container(
              height: 109,
              width: 109,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                image: DecorationImage(
                  image: AssetImage(center['image']),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(width: 12), // Space between image and text
            // Info section
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    center['name'],
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    center['location'],
                    style: const TextStyle(
                      fontSize: 12,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      const Icon(Icons.star, color: Colors.amber, size: 16),
                      const SizedBox(width: 4),
                      Text(
                        '${center['rating']} (${center['reviews']} Reviews)',
                        style: const TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      const Icon(Icons.directions_walk, size: 16, color: Colors.grey),
                      const SizedBox(width: 4),
                      Text(
                        '${center['distance']} km/${center['time']} min',
                        style: const TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                        ),
                      ),
                      const Spacer(),
                      const Icon(Icons.local_hospital, size: 16, color: Colors.grey),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Example data for medical centers
final List<Map<String, dynamic>> centers = [
  {
    'name': 'Sunrise Health Clinic',
    'location': '123 Oak Street, CA 98765',
    'rating': 5.0,
    'reviews': 58,
    'distance': 2.5,
    'time': 40,
    'image': 'assets/img/doctors/Image-3.png',
  },
  {
    'name': 'Golden Cardiology',
    'location': '555 Bridge Street, CA 98765',
    'rating': 4.9,
    'reviews': 102,
    'distance': 2.5,
    'time': 40,
    'image': 'assets/img/doctors/Image-4.png',
  },
  {
    'name': 'Dr.Michael Jonson',
    'location': 'Maple Associates, NY, USA',
    'rating': 4.9,
    'reviews': 102,
    'distance': 2.5,
    'time': 40,
    'image': 'assets/img/doctors/Image-5.png',
  },
  {
    'name': 'Dr.Emily Walker',
    'location': 'Serenity Pediatrics Clinic',
    'rating': 4.9,
    'reviews': 102,
    'distance': 2.5,
    'time': 40,
    'image': 'assets/img/doctors/Image-6.png',
  },
  {
    'name': 'Dr.Emily Walker',
    'location': 'Serenity Pediatrics Clinic',
    'rating': 4.9,
    'reviews': 102,
    'distance': 2.5,
    'time': 40,
    'image': 'assets/img/doctors/Image-7.png',
  },
];
