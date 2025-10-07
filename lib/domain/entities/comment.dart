class Comment {
  final String id;
  final String text;
  final String? attachmentUrl;
  final int likes;
  final int dislikes;
  final List<String> replyIds;

  Comment({
    required this.id,
    required this.text,
    this.attachmentUrl,
    required this.likes,
    required this.dislikes,
    required this.replyIds,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Comment &&
        other.id == id &&
        other.text == text &&
        other.attachmentUrl == attachmentUrl &&
        other.likes == likes &&
        other.dislikes == dislikes &&
        _listEquals(other.replyIds, replyIds);
  }

  @override
  int get hashCode {
    return id.hashCode ^
        text.hashCode ^
        attachmentUrl.hashCode ^
        likes.hashCode ^
        dislikes.hashCode ^
        replyIds.hashCode;
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
