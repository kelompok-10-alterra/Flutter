// ignore_for_file: unused_local_variable

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:kelompok_10/theme/theme.dart';

import '../../component/onboarding_style.dart';
import '../../model/onboarding_model.dart';
import '../sign/sign_in/login_screen.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int currentIndex = 0;

  Widget dots(int index) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 2.0),
      width: currentIndex == index ? 20.0 : 5.0,
      height: 4.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: currentIndex == index ? primaryColor : whiteColor,
      ),
    );
  }

  Widget background() {
    int index = -1;
    return CarouselSlider(
      options: CarouselOptions(
        enableInfiniteScroll: false,
        height: displayHeight(context),
        viewportFraction: 1.0,
        onPageChanged: (index, reason) {
          setState(
            () {
              currentIndex = index;
            },
          );
        },
      ),
      items: data.map(
        (item) {
          index++;
          return Builder(
            builder: (BuildContext context) {
              return OnBoardingStyle(
                images: item.images,
                title: item.title,
              );
            },
          );
        },
      ).toList(),
    );
  }

  Widget content() {
    return Stack(
      children: [
        background(),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Container(
            padding:
                EdgeInsets.symmetric(horizontal: defaultMargin, vertical: 32.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  height: 22.0,
                  child: Center(
                    child: Text(
                      'Skip',
                      style: greyTextStyle.copyWith(
                        color: transparentColor,
                        fontSize: 14.0,
                        fontWeight: regular,
                      ),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    for (int i = 0; i < data.length; i++) dots(i),
                  ],
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LogInScreen(),
                      ),
                    );
                  },
                  child: SizedBox(
                    height: 22.0,
                    child: Center(
                      child: Text(
                        currentIndex != 2 ? '' : 'Done',
                        style: primaryTextStyle.copyWith(
                          fontSize: 16.0,
                          fontWeight: regular,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
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
