class AppCategory {
  final int id;
  final String name;
  final String image;
  final DateTime creationAt;
  final DateTime updatedAt;

  AppCategory({
    required this.id,
    required this.name,
    required this.image,
    required this.creationAt,
    required this.updatedAt,
  });

  factory AppCategory.fromJson(Map<String, dynamic> json) {
    return AppCategory(
      id: json['id'],
      name: json['name'],
      image: json['image'],
      creationAt: DateTime.parse(json['creationAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'image': image,
      'creationAt': creationAt
          .toIso8601String(), // is a method in Dart's DateTime class that converts a DateTime object to a string
      'updatedAt': updatedAt.toIso8601String(),
    };
  }
}
