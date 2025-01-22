import 'package:flutter/material.dart';
import 'package:real_estate_test/authentication/components/logo.dart';
import 'package:real_estate_test/authentication/components/my_button.dart';
import 'package:real_estate_test/authentication/components/password_text_field.dart';
import 'package:real_estate_test/authentication/components/simple_text_field.dart';
import 'package:real_estate_test/authentication/provider/auth_provider.dart';
import 'package:real_estate_test/global/constants.dart';
import 'package:provider/provider.dart';
import 'package:real_estate_test/global/helper_methods.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final key = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool obscureText = true;
  bool isLoading = false;
  // bool isLoading

  void goToRegisterPage() {
    Navigator.pushNamed(context, "/register");
  }

  Future<void> login(BuildContext context) async {
    try {
      if (key.currentState!.validate()) {
        key.currentState!.save();

        // todo: start loading visual

        // todo: validate user credentials
        Provider.of<AuthProvider>(context, listen: false).login(
          email: emailController.text,
          password: passwordController.text.trim(),
        );

        // todo: navigate to homepage
        if (mounted) {
          Navigator.pushNamed(context, "/home");
        }
      }
    } catch (e) {
      if (mounted) {
        showSnackBar(context, message: e.toString());
      }
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        primary: true,
        child: SizedBox(
          height: deviceHeight(context),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 15.0,
              // vertical: kToolbarHeight,
            ),
            child: Form(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // todo: logo
                  Stack(
                    children: [
                      ShaderMask(
                        shaderCallback: (Rect bounds) {
                          return LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.transparent,
                              Colors.black.withValues(alpha: 0.8)
                            ],
                          ).createShader(bounds);
                        },
                        blendMode: BlendMode.dstIn,
                        child: Image.asset(
                          'assets/login_flat_illustration.jpg',
                          fit: BoxFit.cover,
                          width: double.infinity,
                          height: deviceHeight(context) * 0.4,
                        ),
                      ),
                      Positioned(
                        bottom: 10,
                        child: SizedBox(
                          width: deviceWidth(context),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Logo(),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 30),
                  // todo: sign in text
                  Text(
                    "Sign in",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: Theme.of(context).textTheme.bodyLarge!.fontSize,
                    ),
                  ),
                  const SizedBox(height: 20),

                  // todo: email textfield
                  Text(
                    "Email",
                    style: TextStyle(color: Theme.of(context).primaryColor),
                  ),

                  const SizedBox(height: 10),

                  SimpleTextField(
                    controller: emailController,
                    hintText: "Email",
                    prefixIcon: Icon(
                      Icons.person_outline_rounded,
                      color: Colors.grey,
                    ),
                  ),

                  const SizedBox(height: 10),

                  // todo: password textfield
                  Text(
                    "Password",
                    style: TextStyle(color: Theme.of(context).primaryColor),
                  ),
                  const SizedBox(height: 10),
                  PasswordTextField(
                    controller: passwordController,
                    obscureText: obscureText,
                  ),

                  const SizedBox(height: 30),

                  // todo: sign in button
                  MyButton(
                    btnText: "Sign in",
                    onPressed: () {
                      login(context);
                    },
                  ),

                  // todo: oauth sign in options
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
