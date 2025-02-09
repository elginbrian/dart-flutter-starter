class User {
  final String id;
  final String name;
  final String email;
  final String passwordHash;
  final String? imageUrl;
  final String? bio;
  final DateTime createdAt;
  final DateTime updatedAt;

  User({
    required this.id,
    required this.name,
    required this.email,
    this.passwordHash = "",
    this.imageUrl,
    this.bio,
    required this.createdAt,
    required this.updatedAt,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] ?? '',
      name: json['username'] ?? 'Unknown',
      email: json['email'] ?? '',
      passwordHash: '',
      imageUrl: json['image_url'] ?? '',
      bio: json['bio'] ?? '',
      createdAt: json['created_at'] != null
          ? DateTime.parse(json['created_at'])
          : DateTime.now(),
      updatedAt: json['updated_at'] != null
          ? DateTime.parse(json['updated_at'])
          : DateTime.now(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'username': name,
      'email': email,
      'image_url': imageUrl ?? '',
      'bio': bio ?? '',
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
    };
  }
}
