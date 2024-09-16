class Post {
  final int postId;
  final String name;
  final String? content;
  final String? imageUrl;
  final String date;
  final int userId;
  final double likesCount;

  Post({
    required this.postId,
    required this.name,
    this.content,
    this.imageUrl,
    required this.date,
    required this.userId,
    required this.likesCount,
  });
}
