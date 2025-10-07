class PostModel {
  final String id;
  final String content;
  final String? attachmentUrl;
  final int likes;
  final List<String> commentIds;

  PostModel({
    required this.id,
    required this.content,
    this.attachmentUrl,
    required this.likes,
    required this.commentIds,
  });

  factory PostModel.fromJson(Map<String, dynamic> json) {
    return PostModel(
      id: json['id'] as String,
      content: json['content'] as String,
      attachmentUrl: json['attachmentUrl'] as String?,
      likes: json['likes'] as int,
      commentIds: List<String>.from(json['commentIds'] ?? []),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'content': content,
      'attachmentUrl': attachmentUrl,
      'likes': likes,
      'commentIds': commentIds,
    };
  }
}
