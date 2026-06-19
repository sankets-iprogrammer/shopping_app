import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app/core/widgets/buttons.dart';
import 'package:shopping_app/features/authentication/bloc/auth_bloc.dart';
import 'package:shopping_app/features/authentication/bloc/auth_event.dart';
import 'package:shopping_app/features/authentication/model/login_response.dart';
import 'package:shopping_app/features/authentication/screens/register_screen.dart';
import '../../../core/themes/app_theme.dart';
import '../../../core/themes/theme_bloc/theme_bloc.dart';
import '../../../core/validator.dart';
import '../../main_screen/screens/main_screen.dart';
import '../bloc/auth_state.dart';
import '../model/login_request.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  GlobalKey<FormState> _loginFormKey = GlobalKey<FormState>();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  bool _hidePassword = true;

  @override
  Widget build(BuildContext context) {
    final AppTheme theme = context.read<ThemeBloc>().state.currentTheme;
    return Scaffold(
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is LoginSuccess) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text("Login Successful")));
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return MainScreen();
                },
              ),
            );
          } else if (state is AuthError) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(state.message)));
          }
        },
        builder: (context, state) {
          return Padding(
            padding: EdgeInsets.symmetric(
              horizontal: theme.pageHorizontalMargin,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Shop Smarter - Login", style: theme.pageTitle),
                SizedBox(height: 10),
                Text(
                  "Log in to Access Exclusive Deals and Simplify Your Shopping Experience",
                  style: theme.pageDesc,
                ),
                SizedBox(height: 24),
                Form(
                  key: _loginFormKey,
                  child: Column(
                    children: [
                      TextFormField(
                        maxLength: 30,
                        controller: _emailController,
                        decoration: theme.textFieldDecoration(
                          label: "Username",
                          hintText: "Username",
                          iconData: Icons.email_outlined,
                        ),
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return "This field is mandatory";
                          } else if (!isValidEmail(value.trim())) {
                            // return "Invalid email format";     //for testing it is commited
                          } else {
                            return null;
                          }
                        },
                      ),
                      SizedBox(height: 16),
                      TextFormField(
                        obscureText: _hidePassword,
                        maxLength: 10,
                        controller: _passwordController,
                        decoration: theme.textFieldDecoration(
                          label: "Password",
                          hintText: "Password",
                          iconData: Icons.password_outlined,
                          suffixIcon: _hidePassword
                              ? Icons.visibility_off_outlined
                              : Icons.visibility_outlined,
                          onSuffixIconClicked: () {
                            setState(() {
                              _hidePassword = !_hidePassword;
                            });
                          },
                        ),
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return "This field is mandatory";
                          } else if (value.trim().length < 6) {
                            return "Password must contain 6 or more character";
                          } else {
                            return null;
                          }
                        },
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          Checkbox(
                            checkColor: theme.secondaryOnBackgroundColor,
                            fillColor: WidgetStatePropertyAll(
                              theme.secondaryBackgroundColor,
                            ),
                            value: true,
                            onChanged: (value) {},
                          ),
                          Text("Remember Me"),
                          Spacer(),
                          Text(
                            "Forget Password?",
                            style: theme.navigationTextStyle,
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      MyButton.primaryButton(
                        theme: theme,
                        text: "Sign In",
                        loading: state is AuthLoading,
                        onTap: () {
                          if (state is AuthLoading) return;
                          if (_loginFormKey.currentState!.validate()) {
                            context.read<AuthBloc>().add(
                              LoginEvent(
                                loginRequest: LoginRequest(
                                  username: _emailController.text.trim(),
                                  password: _passwordController.text.trim(),
                                ),
                              ),
                            );
                          }
                        },
                      ),
                      SizedBox(height: 10),
                      MyButton.secondaryButton(
                        theme: theme,
                        text: "Create Account",
                        onTap: () {
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //     builder: (context) {
                          //       return RegisterScreen();
                          //     },
                          //   ),
                          // );
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),

      // backgroundColor: Colors.black,
    );
  }
}
