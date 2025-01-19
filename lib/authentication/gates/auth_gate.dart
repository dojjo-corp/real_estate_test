import 'dart:math';

import 'package:flutter/material.dart';
import 'package:real_estate_test/authentication/pages/user_authentication/login_page.dart';
import 'package:real_estate_test/authentication/pages/onboarding_page.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  int getRandNum() {
    return Random().nextInt(10) + 1;
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: Stream.value(getRandNum()),
        builder: (context, snapshot) {
          if (snapshot.data!.isEven) {
            return LoginPage();
          } else {
            return OnboardingPage();
          }
        });
  }
}
