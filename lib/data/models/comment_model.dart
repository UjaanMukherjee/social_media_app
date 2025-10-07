class CommentModel {
  final String id;
  final String text;
  final String? attachmentUrl;
  final int likes;
  final int dislikes;
  final List<String> replyIds;

  CommentModel({
    required this.id,
    required this.text,
    this.attachmentUrl,
    required this.likes,
    required this.dislikes,
    required this.replyIds,
  });

  factory CommentModel.fromJson(Map<String, dynamic> json) {
    return CommentModel(
      id: json['id'] as String,
      text: json['text'] as String,
      attachmentUrl: json['attachmentUrl'] as String?,
      likes: json['likes'] as int,
      dislikes: json['dislikes'] as int,
      replyIds: List<String>.from(json['replyIds'] ?? []),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'text': text,
      'attachmentUrl': attachmentUrl,
      'likes': likes,
      'dislikes': dislikes,
      'replyIds': replyIds,
    };
  }
}
