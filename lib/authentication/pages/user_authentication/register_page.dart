import 'package:flutter/material.dart';
import 'package:real_estate_test/authentication/components/confirm_password_text_field.dart';
import 'package:real_estate_test/authentication/components/logo.dart';
import 'package:real_estate_test/authentication/components/my_button.dart';
import 'package:real_estate_test/authentication/components/password_text_field.dart';
import 'package:real_estate_test/authentication/components/simple_text_field.dart';
import 'package:real_estate_test/global/constants.dart';
import 'package:real_estate_test/global/helper_methods.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final key = GlobalKey<FormState>();
  late final TextEditingController emailController;
  late final TextEditingController passwordController;
  late final TextEditingController confirmPasswordController;
  bool isLoading = false;
  bool obscureText = true;
  bool obscureConfirmText = true;

  Future<void> register(BuildContext context) async {
    showLoadingDialog(context);

    // Future.delayed(Duration(seconds: 3));

    // Navigator.pop(context);
    try {
      if (key.currentState!.validate()) {
        key.currentState!.save();
      }
    } catch (e) {
      if (mounted) {
        showSnackBar(context, message: e.toString());
      }
    }
  }

  void goToLoginPage() {
    Navigator.pushNamed(context, "/login");
  }

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
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
              key: key,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
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
                          'assets/registration_flat_illustration.jpg',
                          fit: BoxFit.cover,
                          width: double.infinity,
                          height: deviceHeight(context) * 0.3,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Logo(),
                    ],
                  ),

                  const SizedBox(height: 30),
                  // todo: sign in text
                  Text(
                    "Register",
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
                      Icons.email_outlined,
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

                  const SizedBox(height: 10),

                  // todo: password textfield
                  Text(
                    "Confirm Password",
                    style: TextStyle(color: Theme.of(context).primaryColor),
                  ),
                  const SizedBox(height: 10),
                  ConfirmPasswordTextField(
                    controller: confirmPasswordController,
                    hintText: "Confirm password",
                    obscureText: obscureConfirmText,
                  ),
                  const SizedBox(height: 30),

                  // todo: sign in button
                  MyButton(
                    onPressed: () {
                      register(context);
                    },
                    btnText: "Register",
                  ),

                  // todo: oauth sign in options
                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Already have an account? "),
            GestureDetector(
              onTap: goToLoginPage,
              child: Text(
                "Login",
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
