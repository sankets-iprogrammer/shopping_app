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

  factory UserDataModel.fromJson(Map<String, dynamic> loginResponce){
    return UserDataModel(
      id: loginResponce["id"],
      username: loginResponce["username"],
      email: loginResponce["email"],
      firstName: loginResponce["firstName"],
      lastName: loginResponce["lastName"],
      gender: loginResponce["gender"],
      image: loginResponce["image"],
    );
  }
}