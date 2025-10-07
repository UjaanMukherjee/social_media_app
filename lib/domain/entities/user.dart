class User {
  final String id;
  final String name;
  final String phoneNumber;
  final List<String> friendIds;
  final List<String> favoritePostIds;
  final String profileInfo;

  User({
    required this.id,
    required this.name,
    required this.phoneNumber,
    required this.friendIds,
    required this.favoritePostIds,
    required this.profileInfo,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is User &&
        id == other.id &&
        name == other.name &&
        phoneNumber == other.phoneNumber &&
        friendIds.length == other.friendIds.length &&
        friendIds.every((id) => other.friendIds.contains(id)) &&
        favoritePostIds.length == other.favoritePostIds.length &&
        favoritePostIds.every((id) => other.favoritePostIds.contains(id)) &&
        profileInfo == other.profileInfo;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        phoneNumber.hashCode ^
        friendIds.fold(0, (prev, id) => prev ^ id.hashCode) ^
        favoritePostIds.fold(0, (prev, id) => prev ^ id.hashCode) ^
        profileInfo.hashCode;
  }
}
