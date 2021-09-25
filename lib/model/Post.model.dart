import 'Owner.model.dart';

class Post {
  String id;
  String image;
  String text;
  String publishDate;
  int likes;
  List<dynamic> tags;
  Owner owner;

  Post({
    required this.id,
    required this.image,
    required this.text,
    required this.publishDate,
    required this.likes,
    required this.tags,
    required this.owner,
  });

  factory Post.fromJson(Map<String, dynamic> json) => Post(
        id: json["id"],
        image: json["image"],
        text: json["text"],
        publishDate: json["publishDate"],
        likes: json["likes"],
        tags: json["tags"],
        owner: Owner.fromJson(json["owner"]),
      );
}
