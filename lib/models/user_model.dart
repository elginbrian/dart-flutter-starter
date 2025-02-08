class User {
  final String id;
  final String name;
  final String email;
  final String passwordHash;
  final String imageUrl;
  final String bio;
  final DateTime createdAt;
  final DateTime updatedAt;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.passwordHash,
    required this.imageUrl,
    required this.bio,
    required this.createdAt,
    required this.updatedAt,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      passwordHash: '',
      imageUrl: json['image_url'],
      bio: json['bio'],
      createdAt: DateTime.parse(json['created']),
      updatedAt: DateTime.parse(json['updated']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'image_url': imageUrl,
      'bio': bio,
      'created': createdAt.toIso8601String(),
      'updated': updatedAt.toIso8601String(),
    };
  }
}
