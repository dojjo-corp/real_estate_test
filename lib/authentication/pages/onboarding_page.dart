import 'package:flutter/material.dart';
import 'package:real_estate_test/authentication/pages/onboarding_pages/page_one.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  // page controller
  final PageController controller = PageController(initialPage: 0);
  final List<Widget> pages = [
    PageOne(imageAssetName: "assets/friends_flat_illustration.png"),
    PageOne(imageAssetName: "assets/login_flat_illustration.png"),
    PageOne(imageAssetName: "assets/self_learning_flat_illustration.png")
  ];

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(),
      body: PageView(
        controller: controller,
        pageSnapping: true,
        scrollDirection: Axis.horizontal,
        children: pages,
      ),
    );
  }
}
