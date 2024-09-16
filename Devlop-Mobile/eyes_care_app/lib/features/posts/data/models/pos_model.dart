import '../../domain/entities/post.dart';

class PostModel extends Post {
  PostModel({
    required super.postId,
    required super.name,
    required super.date,
    required super.userId,
    required super.likesCount,
    super.imageUrl,
    super.content,
  });
  factory PostModel.fromJson(Map<String, dynamic> json) {
    return PostModel(
      postId: json['id'],
      name: json['name'],
      content: json['content'],
      imageUrl: json['imageUrl'],
      date: (json['date']),
      userId: json['user_id'],
      likesCount: json['likesCount'].toDouble(),
    );
  }

  static List<PostModel> fromListJson(List<Map<String, dynamic>> jsonList) {
    return jsonList.map((json) => PostModel.fromJson(json)).toList();
  }

  Map<String, dynamic> toJson() {
    return {
      'id': postId,
      'name': name,
      'content': content,
      'imageUrl': imageUrl,
      'date': date,
      'user_id': userId,
      'likesCount': likesCount,
    };
  }

  @override
  String toString() {
    return "{id: $postId, name: $name, content: $content}";
  }
}
