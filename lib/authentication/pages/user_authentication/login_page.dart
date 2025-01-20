import 'package:flutter/material.dart';
import 'package:real_estate_test/authentication/components/logo.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

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
        child: Column(
          children: [
            // todo: logo
            Logo(),

            // todo: sign in text
            Text(
              "Sign in",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            // todo: email textfield
            TextFormField(
              controller: emailController,
              
              maxLines: 1,
            )

            // todo: password textfield

            // todo: sign in button

            // todo: oauth sign in options
          ],
        ),
      ),
    );
  }
}
