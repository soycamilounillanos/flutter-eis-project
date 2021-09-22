import 'Owner.model.dart';

class Comment {
  String id;
  String message;
  String post;
  String publishDate;
  Owner owner;

  Comment({
    required this.id,
    required this.message,
    required this.post,
    required this.publishDate,
    required this.owner,
  });

  factory Comment.fromJson(Map<String, dynamic> json) => Comment(
    id: json["id"],
    message: json["message"],
    post: json["post"],
    publishDate: json["publishDate"],
    owner: Owner.fromJson(json["owner"]),
  );
}