import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kelompok_10/animation/scale_animation.dart';
import 'package:kelompok_10/animation/shimmer_effect.dart';
import 'package:kelompok_10/component/banner_style.dart';
import 'package:kelompok_10/component/dots_indicator.dart';
import 'package:kelompok_10/model/banner_model.dart';
import 'package:kelompok_10/theme/theme.dart';
import 'package:shimmer/shimmer.dart';

import '../component/card_gridview.dart';
import '../component/category_style.dart';
import 'detail_category.dart';
import 'detail_class.dart';
import 'on_search_screen.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/home-screen';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;

  final CarouselController controllerBanner = CarouselController();
  final TextEditingController searchController = TextEditingController();

  Widget header() {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(
            top: defaultMargin,
            left: defaultMargin,
            right: defaultMargin,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Text(
                  'Hallo Intan',
                  style: blackTextStyle.copyWith(
                    fontSize: 24.0,
                    fontWeight: semiBold,
                    overflow: TextOverflow.ellipsis,
                  ),
                  maxLines: 1,
                ),
              ),
              const SizedBox(
                width: 16.0,
              ),
              SvgPicture.asset(
                'assets/svg/ic-lonceng.svg',
                height: 24.0,
                color: primaryColor,
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 16.0,
        ),
      ],
    );
  }

  Widget search() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: defaultMargin),
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, OnSearchScreen.routeName);
        },
        child: Container(
          height: 50,
          padding: const EdgeInsets.symmetric(
            vertical: 8.0,
            horizontal: 16.0,
          ),
          decoration: BoxDecoration(
            color: greyThreeColor,
            borderRadius: BorderRadius.circular(24.0),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Mau Olahraga apa hari ini?',
                style: greyTextStyle.copyWith(
                  fontSize: 14.0,
                  fontWeight: regular,
                ),
              ),
              SvgPicture.asset(
                'assets/svg/ic-search.svg',
                color: greyColor,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget banner() {
    return SizedBox(
      height: 145.0,
      child: Stack(
        children: [
          CarouselSlider(
            carouselController: controllerBanner,
            options: CarouselOptions(
              viewportFraction: 1.0,
              height: 145.0,
              enlargeCenterPage: true,
              onPageChanged: (index, reason) {
                setState(
                  () {
                    currentIndex = index;
                  },
                );
              },
            ),
            items: bannerList.map((banner) {
              return Builder(
                builder: (BuildContext context) {
                  return BannerStyle(
                    image: banner.image,
                    title: banner.title,
                    discount: banner.discount,
                    date: banner.date,
                  );
                },
              );
            }).toList(),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 12.0),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: bannerList.asMap().entries.map(
                  (entry) {
                    return GestureDetector(
                      onTap: () => controllerBanner.animateToPage(entry.key),
                      child: DotsIndicator(
                        currentIndex: currentIndex,
                        index: entry.key,
                      ),
                    );
                  },
                ).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget category() {
    return Padding(
      padding: EdgeInsets.only(
        top: defaultMargin,
        left: defaultMargin,
        right: defaultMargin,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Kategori',
            style: blackTextStyle.copyWith(
              fontSize: 18.0,
              fontWeight: semiBold,
            ),
          ),
          const SizedBox(
            height: 10.0,
          ),
          GridView(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              childAspectRatio: 1.0,
              crossAxisSpacing: 16.0,
              mainAxisSpacing: 16.0,
            ),
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            children: List.generate(
              6,
              (index) => GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, DetailCategory.routeName);
                },
                child: const CategoryStyle(),
              ),
            ),
          ),
          SizedBox(
            height: defaultMargin,
          ),
        ],
      ),
    );
  }

  Widget favoriteClass() {
    return Padding(
      padding: EdgeInsets.only(
        left: defaultMargin - 6.0,
        right: defaultMargin - 6.0,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // SizedBox(
          //   height: 18.0,
          //   width: displayWidth(context) * 0.27,
          //   child: ShimmerEffect(
          //     child: Container(
          //       color: whiteColor,
          //     ),
          //   ),
          // ),
          Text(
            'Kelas favorit',
            style: blackTextStyle.copyWith(
              fontSize: 18.0,
              fontWeight: semiBold,
            ),
          ),
          const SizedBox(
            height: 10.0,
          ),
          GridView(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.68,
              crossAxisSpacing: 16.0,
              mainAxisSpacing: 16.0,
            ),
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            children: List.generate(
              6,
              (index) => GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, DetailClass.routeName);
                  },
                  child: const CardGridView()),
            ),
          ),
          SizedBox(
            height: defaultMargin,
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView(
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          children: [
            header(),
            search(),
            banner(),
            category(),
            favoriteClass(),
          ],
        ),
      ),
    );
  }
}
