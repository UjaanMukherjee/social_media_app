class Post {
  final String id;
  final String content;
  final String? attachmentUrl; // Can be image or video URL
  final int likes;
  final List<String> commentIds;

  Post({
    required this.id,
    required this.content,
    this.attachmentUrl,
    required this.likes,
    required this.commentIds,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Post &&
        other.id == id &&
        other.content == content &&
        other.attachmentUrl == attachmentUrl &&
        other.likes == likes &&
        _listEquals(other.commentIds, commentIds);
  }

  @override
  int get hashCode {
    return id.hashCode ^
        content.hashCode ^
        (attachmentUrl?.hashCode ?? 0) ^
        likes.hashCode ^
        commentIds.hashCode;
  }

  // Helper for list equality
  bool _listEquals(List<String> a, List<String> b) {
    if (a.length != b.length) return false;
    for (int i = 0; i < a.length; i++) {
      if (a[i] != b[i]) return false;
    }
    return true;
  }
}
