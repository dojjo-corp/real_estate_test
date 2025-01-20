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

  void goToNextPage() {
    controller.nextPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.linear,
    );
    if (mounted) {
      setState(() {});
    }
    print(controller.page);
  }

  void goToPreviousPage() {
    controller.previousPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.linear,
    );
    if (mounted) {
      setState(() {});
    }
    print(controller.page);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(),
      body: Stack(
        children: [
          PageView(
            controller: controller,
            pageSnapping: true,
            scrollDirection: Axis.horizontal,
            children: pages,
          ),
          Positioned(
            bottom: 40,
            right: 25,
            child: IconButton.filled(
              onPressed: goToNextPage,
              color: Theme.of(context).primaryColor,
              icon: Icon(
                Icons.arrow_forward_rounded,
                color: Colors.white,
              ),
            ),
          ),
          controller.page != controller.initialPage
              ? Positioned(
                  bottom: 40,
                  left: 25,
                  child: IconButton.outlined(
                    onPressed: goToPreviousPage,
                    color: Colors.white,
                    icon: Icon(
                      Icons.arrow_back_rounded,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                )
              : Container()
        ],
      ),
    );
  }
}
