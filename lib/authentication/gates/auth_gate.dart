import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:real_estate_test/authentication/pages/homepage.dart';
import 'package:real_estate_test/authentication/pages/onboarding_page.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  int getRandNum() {
    return Random().nextInt(10) + 1;
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return MyHomePage();
          }
          return OnboardingPage();
        });
  }
}
