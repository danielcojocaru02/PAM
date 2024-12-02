class Banner {
  final String image;


  Banner({
    required this.image,
  });

  // Factory constructor to create Doctor from JSON
  factory Banner.fromJson(Map<String, dynamic> json) {
    return Banner(
      image: json['image'],
    );
  }
}
