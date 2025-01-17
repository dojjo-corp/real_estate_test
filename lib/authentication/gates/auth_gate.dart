import 'package:flutter/material.dart';
import 'package:real_estate_test/authentication/pages/user_authentication/login_page.dart';
import 'package:real_estate_test/authentication/pages/onboarding_page.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: Stream.value(9),
        builder: (context, snapshot) {
          if (snapshot.data == 0)
            return LoginPage();
          else {
            return OnboardingPage();
          }
        });
  }
}
