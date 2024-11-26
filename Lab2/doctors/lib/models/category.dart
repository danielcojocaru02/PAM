class Category {
  final String name;
  final String image;
  final String color;

  Category({
    required this.name,
    required this.image,
    required this.color,
  });

  // Create Category from JSON
  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      name: json['name'] as String,
      image: json['image'] as String,
      color: json['color'] as String,
    );
  }
}
