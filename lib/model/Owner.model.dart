class Owner {
  String id;
  String title;
  String firstName;
  String lastName;
  String picture;

  Owner({
    required this.id,
    required this.title,
    required this.firstName,
    required this.lastName,
    required this.picture,
  });

  factory Owner.fromJson(Map<String, dynamic> json) => Owner(
    id: json["id"],
    title: json["title"],
    firstName: json["firstName"],
    lastName: json["lastName"],
    picture: json["picture"],
  );
}
