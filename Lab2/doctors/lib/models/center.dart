class MedicalCenter {
  final String image;
  final String name;
  final String location;
  final double rating;
  final int reviews;
  final double distance;
  final int time;

  MedicalCenter({
    required this.image,
    required this.name,
    required this.location,
    required this.rating,
    required this.reviews,
    required this.distance,
    required this.time,
  });

  // Factory method to create a MedicalCenter from JSON
  factory MedicalCenter.fromJson(Map<String, dynamic> json) {
    return MedicalCenter(
      image: json['image'],  // Matches 'image' in the JSON
      name: json['name'],    // Matches 'name' in the JSON
      location: json['location'],  // Matches 'location' in the JSON
      rating: json['rating'].toDouble(),  // Matches 'rating' and converts to double
      reviews: json['reviews'],  // Matches 'reviews'
      distance: json['distance'].toDouble(),  // Matches 'distance' and converts to double
      time: json['time'],  // Matches 'time'
    );
  }

  // Convert a MedicalCenter object to JSON
  Map<String, dynamic> toJson() {
    return {
      'image': image,
      'name': name,
      'location': location,
      'rating': rating,
      'reviews': reviews,
      'distance': distance,
      'time': time,
    };
  }
}
