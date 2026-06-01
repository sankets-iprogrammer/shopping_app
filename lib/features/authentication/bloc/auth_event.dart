import 'package:shopping_app/features/authentication/model/login_request.dart';

abstract class AuthEvent {}

class LoginEvent extends AuthEvent{
  LoginRequest loginRequest;
  LoginEvent({
    required this.loginRequest
  });
}

class SignupEvent extends AuthEvent{
  final String name;
  final String email;
  final String password;
  SignupEvent({
    required this.name,
    required this.email,
    required this.password
});
}