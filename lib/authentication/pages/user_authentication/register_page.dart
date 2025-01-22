import 'package:flutter/material.dart';
import 'package:real_estate_test/authentication/components/logo.dart';
import 'package:real_estate_test/authentication/components/password_text_field.dart';
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
    try {
      if (key.currentState!.validate()) {
        key.currentState!.save();

        setState(() {
          isLoading = true;
        });
      }
    } catch (e) {
      if (mounted) {
        showSnackBar(context, message: e.toString());
      }
    }
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
                      Positioned(
                        bottom: 20,
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

                  TextFormField(
                    controller: emailController,
                    maxLines: 1,
                    decoration: InputDecoration(
                      hintText: "Email",
                      hintStyle: const TextStyle(color: Colors.grey),
                      prefixIcon: Icon(
                        Icons.person_outline_rounded,
                        color: Colors.grey,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(
                          color: Colors.grey[50]!,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(
                          color: Colors.grey[300]!,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(
                          color: Theme.of(context)
                              .primaryColor
                              .withValues(alpha: 0.6),
                          width: 2,
                        ),
                      ),
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

                  // todo: password textfield
                  Text(
                    "Confirm Password",
                    style: TextStyle(color: Theme.of(context).primaryColor),
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    controller: confirmPasswordController,
                    maxLines: 1,
                    obscureText: obscureConfirmText,
                    decoration: InputDecoration(
                      hintText: "Confirm Password",
                      hintStyle: const TextStyle(color: Colors.grey),
                      prefixIcon: Icon(
                        Icons.lock_outline_rounded,
                        color: Colors.grey,
                      ),
                      suffixIcon: GestureDetector(
                        onTap: () {
                          setState(() {
                            obscureConfirmText = !obscureConfirmText;
                          });
                        },
                        child: Icon(
                          obscureConfirmText
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: Colors.grey,
                        ),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(
                          color: Colors.grey[50]!,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(
                          color: Colors.grey[300]!,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(
                          color: Theme.of(context)
                              .primaryColor
                              .withValues(alpha: 0.6),
                          width: 2,
                        ),
                      ),
                    ),
                  ),

                  // todo: sign in button
                  ElevatedButton(
                    onPressed: () {
                      register(context);
                    },
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(double.infinity, 45),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                      backgroundColor: Theme.of(context).primaryColor,
                      foregroundColor: Colors.white,
                    ),
                    child: const Text(
                      "Sign in",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
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
