import 'package:flutter/material.dart';
import 'package:plant_app/constants.dart';
import 'package:plant_app/ui/screen/onboarding/indicator.dart';
import 'package:plant_app/ui/screen/onboarding/onboarding_page.dart';
import 'package:plant_app/ui/screen/root_page.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  late final pageController = PageController(initialPage: 0);
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
            onPressed: navigateToRootPage,
            child: const Text(
              'Skip',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        child: Stack(
          children: [
            PageView(
              controller: pageController,
              onPageChanged: (value) {
                setState(() {
                  currentIndex = value;
                });
              },
              children: const [
                OnBoardingPage(
                  imageUrl: 'assets/images/plant-one.png',
                  title: Constants.titleOne,
                  description: Constants.descriptionOne,
                ),
                OnBoardingPage(
                  imageUrl: 'assets/images/plant-two.png',
                  title: Constants.titleTwo,
                  description: Constants.descriptionTwo,
                ),
                OnBoardingPage(
                  imageUrl: 'assets/images/plant-three.png',
                  title: Constants.titleThree,
                  description: Constants.descriptionThree,
                )
              ],
            ),
            Positioned(
              bottom: 50,
              left: 0,
              right: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Indicator(currentIndex: currentIndex, size: 3),
                  DecoratedBox(
                    decoration: const BoxDecoration(
                      color: Constants.primaryColor,
                      shape: BoxShape.circle,
                    ),
                    child: IconButton(
                      onPressed: onNextClicked,
                      icon: const Icon(
                        Icons.arrow_forward_ios,
                        size: 24,
                        color: Colors.white,
                      ),
                      padding: const EdgeInsets.all(4),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void navigateToRootPage() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (_) => const RootPage(),
      ),
    );
  }

  void onNextClicked() async {
    setState(() {
      if (currentIndex < 2) {
        currentIndex++;
        pageController.nextPage(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeIn,
        );
      } else {
        navigateToRootPage();
      }
    });
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }
}
