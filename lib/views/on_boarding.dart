import 'package:flutter/material.dart';
import 'package:suits/core/widgets/app_image.dart';
import 'package:suits/core/widgets/app_button.dart';
import 'package:suits/core/widgets/app_text.dart';
import 'package:suits/views/login.dart';

part 'get_started.dart';
class OnBoardingPage {
  final String title;
  final String? description;
  final String image;

  OnBoardingPage({required this.title, this.description, required this.image});
}

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({super.key});

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  final controller = PageController();
  late int currentPage = 0;

  @override
  void initState() {
    controller.addListener(() {
      setState(() {
        currentPage = controller.page!.toInt();
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  final onBoardingPages = [
    OnBoardingPage(
      title: "Welcome To Fashion",
      description:
          "Discover the latest trends and exclusive styles from our top designers",
      image: "assets/images/onboarding1.jpg",
    ),
    OnBoardingPage(
      title: "Explore & Shop",
      description:
          "DDiscover a wide range of fashion categories, browse new arrivals and shop your favourites",
      image: "assets/images/onboarding2.jpg",
    ),
    OnBoardingPage(
      title: "Hi,Shop Now",
      image: "assets/images/onboarding3.jpg",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.primaryColor,
      body: SafeArea(
        child: Stack(
          alignment: AlignmentGeometry.bottomCenter,
          children: [
            PageView.builder(
              controller: controller,
              itemCount: onBoardingPages.length,
              itemBuilder: (context, index) {
                final page = onBoardingPages[index];
                return Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(page.image),
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              },
            ),
            Positioned(
              bottom: 24,
              right: 0,
              left: 0,
              child: Padding(
                padding: const EdgeInsetsGeometry.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    if (currentPage != 0)
                      InkWell(
                        onTap: () => controller.previousPage(
                          duration: const Duration(milliseconds: 200),
                          curve: Curves.linear,
                        ),
                        child: Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: const Color(0xFF4E6542)),
                          ),
                          child: const AppImage(image: "back.svg"),
                        ),
                      ),
                    if (currentPage == 0) const SizedBox(width: 50, height: 50),
                    Row(
                      children: List.generate(
                        onBoardingPages.length,
                        (index) => Container(
                          width: currentPage == index ? 15 : 10,
                          height: currentPage == index ? 15 : 10,
                          margin: const EdgeInsetsDirectional.symmetric(
                            horizontal: 5,
                          ),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: currentPage == index
                                ? theme.primaryColor
                                : const Color(0xFFD9D9D9),
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        if (currentPage == onBoardingPages.length - 1) {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute<void>(
                              builder: (context) => const GetStarted(),
                            ),
                          );
                        } else {
                          controller.nextPage(
                            duration: const Duration(milliseconds: 200),
                            curve: Curves.linear,
                          );
                        }
                      },
                      child: Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: theme.primaryColor,
                        ),
                        child: Transform.flip(
                          flipX: true,
                          child: const AppImage(image: "arrow.svg"),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            if (currentPage != onBoardingPages.length - 1)
            Positioned(
              top: 24,
              right: 14,
              child: AppButton(
                onPressed: () => Navigator.pushReplacement(
                  context,
                  MaterialPageRoute<void>(
                    builder: (context) => const GetStarted(),
                  ),
                ),
                text: "Skip",
                textStyle: theme.textTheme.bodySmall,
                color: Colors.transparent,
                padding: const EdgeInsetsDirectional.symmetric(
                  horizontal: 25,
                  vertical: 20,
                ),
                shape: RoundedSuperellipseBorder(
                  side: const BorderSide(color: Colors.black),
                  borderRadius: BorderRadius.circular(50),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
