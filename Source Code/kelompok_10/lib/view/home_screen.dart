import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kelompok_10/component/banner_style.dart';
import 'package:kelompok_10/component/dots_indicator.dart';
import 'package:kelompok_10/component/small_button_orange.dart';
import 'package:kelompok_10/model/banner_model.dart';
import 'package:kelompok_10/theme/theme.dart';

import '../component/card_gridview.dart';
import '../component/category_style.dart';
import '../component/search_text_input.dart';
import 'detail_category.dart';
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

  Widget content(context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.vertical,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // NOTE : HEADER
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
          //Search
          Padding(
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
          ),
          SizedBox(
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
                            onTap: () =>
                                controllerBanner.animateToPage(entry.key),
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
          ),

          //Note : Category

          Padding(
            padding: EdgeInsets.only(
              top: defaultMargin,
              left: defaultMargin,
              right: defaultMargin,
            ),
            child: GridView(
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
                    child: const CategoryStyle()),
              ),
            ),
          ),

          // Note : Register Member

          Container(
            margin: EdgeInsets.all(defaultMargin),
            height: 74.0,
            width: displayWidth(context),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomRight,
                colors: [
                  gradientThreeColor,
                  gradientFourColor,
                ],
              ),
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(12.0),
                      bottomLeft: Radius.circular(12.0),
                    ),
                    child: Image.asset('assets/images/banner-three.png'),
                  ),
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Gabung jadi Member',
                        style: whiteTextStyle.copyWith(
                          fontSize: 14.0,
                          fontWeight: medium,
                          overflow: TextOverflow.ellipsis,
                        ),
                        maxLines: 1,
                      ),
                      SizedBox(
                        width: displayWidth(context) * 0.35,
                        child: Divider(
                          color: orangeColor,
                          thickness: 2.0,
                        ),
                      ),
                      Text(
                        'Diskon Up to 60%',
                        style: whiteTextStyle.copyWith(
                          fontSize: 14.0,
                          fontWeight: medium,
                          overflow: TextOverflow.ellipsis,
                        ),
                        maxLines: 1,
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 64.0,
                  margin: const EdgeInsets.only(
                    right: 16.0,
                  ),
                  child: SmallOrangeButton(
                    press: () {},
                    text: 'Daftar',
                  ),
                )
              ],
            ),
          ),

          // Note: Kelas Favorit

          Padding(
            padding: EdgeInsets.only(
              left: defaultMargin - 6.0,
              right: defaultMargin - 6.0,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
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
                    (index) => const CardGridView(),
                  ),
                ),
              ],
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
        body: content(context),
      ),
    );
  }
}
