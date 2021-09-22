class UserProfile {
  String id;
  String title;
  String firstName;
  String lastName;
  String picture;
  String gender;
  String email;
  String dateOfBirth;
  String phone;
  String registerDate;
  String updatedDate;
  Location location;

  UserProfile({
    required this.id,
    required this.title,
    required this.firstName,
    required this.lastName,
    required this.picture,
    required this.gender,
    required this.email,
    required this.dateOfBirth,
    required this.phone,
    required this.registerDate,
    required this.updatedDate,
    required this.location,
  });

  factory UserProfile.fromJson(Map<String, dynamic> json) => UserProfile(
    id: json["id"],
    title: json["title"],
    firstName: json["firstName"],
    lastName: json["lastName"],
    picture: json["picture"],
    gender: json["gender"],
    email: json["email"],
    dateOfBirth: json["dateOfBirth"],
    phone: json["phone"],
    registerDate: json["registerDate"],
    updatedDate: json["updatedDate"],
    location: Location.fromJson(json["location"]),
  );
}

class Location {
  String street;
  String city;
  String state;
  String country;
  String timezone;

  Location({
    required this.street,
    required this.city,
    required this.state,
    required this.country,
    required this.timezone,
  });

  factory Location.fromJson(Map<String, dynamic> json) => Location(
    street: json["street"],
    city: json["city"],
    state: json["state"],
    country: json["country"],
    timezone: json["timezone"],
  );
}
