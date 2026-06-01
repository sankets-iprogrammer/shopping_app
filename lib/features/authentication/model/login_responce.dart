class LoginResponse {
  int id;
  String username;
  String email;
  String firstName;
  String lastName;
  String gender;
  String image;
  String accessToken;
  String refreshToken;
  LoginResponse({
    required this.id,
    required this.username,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.gender,
    required this.image,
    required this.accessToken,
    required this.refreshToken
});

  factory LoginResponse.fromJson(Map<String,dynamic> loginResponce){
    return LoginResponse(
        id: loginResponce["id"],
        username: loginResponce["username"],
        email: loginResponce["email"],
        firstName: loginResponce["firstName"],
        lastName: loginResponce["lastName"],
        gender: loginResponce["gender"],
        image: loginResponce["image"],
        accessToken: loginResponce["accessToken"],
        refreshToken: loginResponce["refreshToken"]
    );
  }

}