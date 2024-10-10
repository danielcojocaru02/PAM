import 'package:flutter/material.dart';

class CentersContainer extends StatelessWidget {
  const CentersContainer({super.key});

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
                        'Nearby Medical Centers',
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
                      'See All',
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
        // Horizontal List of Medical Centers
        SizedBox(
          height: 260, // Fixed height for the card list
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
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

  // Method to build each medical center card
  Widget buildCenterCard(Map<String, dynamic> center) {
    return Container(
      width: 250, // Card width to match the design
      margin: const EdgeInsets.only(right: 16), // Margin between cards
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image section
          Container(
            height: 120,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
              ),
              image: DecorationImage(
                image: AssetImage(center['image']),
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Info section
          Padding(
            padding: const EdgeInsets.all(12),
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
                      style:  const TextStyle(
                        fontSize: 12,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
                 const Divider(
                      color: Colors.grey, 
                      thickness: 1,      
                      indent: 5,        
                      endIndent: 5,  
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
    'image': 'assets/img/sunrise_clinic.png',
  },
  {
    'name': 'Golden Cardiology',
    'location': '555 Bridge Street, CA 98765',
    'rating': 4.9,
    'reviews': 102,
    'distance': 2.5,
    'time': 40,
    'image': 'assets/img/golden_cardiology.png',
  },
];
