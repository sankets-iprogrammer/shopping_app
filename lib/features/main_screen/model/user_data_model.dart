class UserDataModel{
  int id;
  String username;
  String? email;
  String? firstName;
  String? lastName;
  String? gender;
  String? image;

  UserDataModel({
    required this.id,
    required this.username,
    this.email,
    this.firstName,
    this.lastName,
    this.gender,
    this.image
});
}