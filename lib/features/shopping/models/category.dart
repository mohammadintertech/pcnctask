class AppCategory {
  final int id;
  final String name;
  final String image;

  AppCategory({
    required this.id,
    required this.name,
    required this.image,
  });

  factory AppCategory.fromJson(Map<String, dynamic> json) {
    return AppCategory(
      id: json['id'],
      name: json['name'],
      image: json['image'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'image': image,
    };
  }
}
