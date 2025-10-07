class UserModel {
  final String id;
  final String name;
  final String phoneNumber;
  final List<String> friendIds;
  final List<String> favoritePostIds;
  final String profileInfo;

  UserModel({
    required this.id,
    required this.name,
    required this.phoneNumber,
    required this.friendIds,
    required this.favoritePostIds,
    required this.profileInfo,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] as String,
      name: json['name'] as String,
      phoneNumber: json['phoneNumber'] as String,
      friendIds: List<String>.from(json['friendIds'] ?? []),
      favoritePostIds: List<String>.from(json['favoritePostIds'] ?? []),
      profileInfo: json['profileInfo'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'phoneNumber': phoneNumber,
      'friendIds': friendIds,
      'favoritePostIds': favoritePostIds,
      'profileInfo': profileInfo,
    };
  }
}
