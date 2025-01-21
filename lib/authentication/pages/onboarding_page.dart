import 'package:flutter/material.dart';
import 'package:real_estate_test/authentication/pages/onboarding_pages/page_one.dart';
import 'package:real_estate_test/global/constants.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  // page controller
  final PageController controller = PageController(initialPage: 0);

  int pageTrackerInt = 0;
  final List<Widget> pages = [
    PageOne(imageAssetName: "assets/flat_illustration_1"),
    PageOne(imageAssetName: "assets/flat_illustration_2"),
    PageOne(imageAssetName: "assets/flat_illustration_3")
  ];

  void goToLogin() {
    Navigator.pushNamed(context, "/login");
  }

  void goToNextPage() {
    controller.nextPage(
      duration: const Duration(milliseconds: 500),
      curve: Curves.linear,
    );
    setState(() {
      pageTrackerInt = controller.page!.toInt();
    });
  }

  void goToPreviousPage() {
    controller.previousPage(
      duration: const Duration(milliseconds: 500),
      curve: Curves.linear,
    );
    setState(() {
      pageTrackerInt = controller.page!.toInt();
    });
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
            bottom: 50,
            child: SizedBox(
              width: deviceWidth(context),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // todo: previous button

                  // todo: page indicator
                  SmoothPageIndicator(
                    controller: controller,
                    count: pages.length,
                    effect: ExpandingDotsEffect(
                      activeDotColor: Theme.of(context).primaryColor,
                      dotColor: Colors.grey[300]!,
                      dotHeight: 10,
                      dotWidth: 10,
                    ),
                  ),

                  // todo: next button
                ],
              ),
            ),
          ),

          // todo: skip to auth pages
          Positioned(
            bottom: 15,
            right: 15,
            child: TextButton(
              onPressed: goToLogin,
              child: const Text("Skip"),
            ),
          ),
          // Positioned(
          //   bottom: 40,
          //   right: 25,
          //   child: IconButton.filled(
          //     onPressed: goToNextPage,
          //     color: Theme.of(context).primaryColor,
          //     icon: Icon(
          //       Icons.arrow_forward_rounded,
          //       color: Colors.white,
          //     ),
          //   ),
          // ),
          // pageTrackerInt == 0
          //     ? Positioned(
          //         bottom: 40,
          //         left: 25,
          //         child: IconButton.outlined(
          //           onPressed: goToPreviousPage,
          //           color: Colors.white,
          //           icon: Icon(
          //             Icons.arrow_back_rounded,
          //             color: Theme.of(context).primaryColor,
          //           ),
          //         ),
          //       )
          //     : Container()
        ],
      ),
    );
  }
}
