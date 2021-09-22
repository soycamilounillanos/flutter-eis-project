class User {
  String id;
  String title;
  String firstName;
  String lastName;
  String picture;

  User({
    required this.id,
    required this.title,
    required this.firstName,
    required this.lastName,
    required this.picture,
  });
  
  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"],
    title: json["title"],
    firstName: json["firstName"],
    lastName: json["lastName"],
    picture: json["picture"],
  );
}
