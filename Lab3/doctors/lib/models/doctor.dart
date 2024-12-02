class Doctor {
  final String image;
  final String fullName;
  final String typeOfDoctor;
  final String locationOfCenter;
  final double reviewRate;
  final int reviewsCount;

  Doctor({
    required this.image,
    required this.fullName,
    required this.typeOfDoctor,
    required this.locationOfCenter,
    required this.reviewRate,
    required this.reviewsCount,
  });

  // Factory constructor to create Doctor from JSON
  factory Doctor.fromJson(Map<String, dynamic> json) {
    return Doctor(
      image: json['image'],
      fullName: json['full_name'],
      typeOfDoctor: json['type_of_doctor'],
      locationOfCenter: json['location_of_center'],
      reviewRate: json['review_rate'].toDouble(),
      reviewsCount: json['reviews_count'],
    );
  }
}
