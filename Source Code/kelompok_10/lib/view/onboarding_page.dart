// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:kelompok_10/animation/fade_animation.dart';

import 'package:kelompok_10/theme/theme.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../component/onboarding_style.dart';
import '../../model/onboarding_model.dart';
import 'login_screen.dart';

class OnboardingScreen extends StatefulWidget {
  static const routeName = '/onboarding';
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final _pageController = PageController();
  bool isLastPage = false;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  Widget bottomSheets() {
    return Container(
      height: 54,
      color: transparentColor,
      width: displayWidth(context),
      padding: EdgeInsets.symmetric(horizontal: defaultMargin),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextButton(
            onPressed: () {
              _pageController.jumpToPage(2);
            },
            child: Text(
              'Lewati',
              style: whiteTextStyle.copyWith(
                color: isLastPage ? transparentColor : titleColor,
                fontSize: 16.0,
                fontWeight: medium,
              ),
            ),
          ),
          Center(
            child: SmoothPageIndicator(
                controller: _pageController,
                count: 3,
                effect: ExpandingDotsEffect(
                  activeDotColor: orangeColor,
                  dotColor: whiteColor,
                  dotHeight: 8,
                  dotWidth: 8,
                  spacing: 8,
                ),
                onDotClicked: (index) {
                  _pageController.jumpToPage(index);
                }),
          ),
          TextButton(
            onPressed: () {
              isLastPage
                  ? Navigator.pushReplacementNamed(
                      context, LogInScreen.routeName)
                  : _pageController.nextPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    );
            },
            style: ButtonStyle(
              overlayColor: MaterialStateProperty.all(transparentColor),
            ),
            child: Text(
              isLastPage ? 'Masuk' : 'Next',
              style: whiteTextStyle.copyWith(
                color: orangeColor,
                fontSize: 16.0,
                fontWeight: semiBold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget content() {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                gradientOneColor,
                gradientTwoColor,
              ],
            ),
            image: const DecorationImage(
              image: AssetImage('assets/images/il-onboarding.png'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        PageView(
          controller: _pageController,
          onPageChanged: (index) {
            setState(() {
              isLastPage = index == 2;
            });
          },
          children: List.generate(
              dataOnboard.length,
              (index) => dataOnboard
                  .map(
                    (e) => FadeAnimation(
                      child: OnBoardingStyle(
                        images: e.images,
                        title: e.title,
                      ),
                    ),
                  )
                  .toList()[index]),
        ),
        Positioned(
          bottom: 0,
          child: bottomSheets(),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: content(),
    );
  }
}
